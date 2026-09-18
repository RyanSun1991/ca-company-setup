#!/usr/bin/env bash
# check-sanitized.sh — 对本 skill 目录做敏感信息扫描(通用模式 + 可选 denylist)。
# 用法:scripts/check-sanitized.sh [skill_dir] [-d denylist.txt]
# 输出每个模式的命中(file:line:text);退出码 1 = 存在"硬命中"(需消除),0 = 只有需在报告里逐条说明的"软命中"或无命中。
#   硬:9 位纯数字(BN/账号形态)、5 位-3 位(transit-institution 形态)、Gmail 个人邮箱域名、真实公司名关键词
#       (SKILL.md 含「实操样本」的那一行例外)、含数字的 10 位大写字母数字串(Team ID / Enrollment ID 形态)、denylist 任一命中
#   软:CRA 程序账户通用后缀(RT/RC/RP + 000,非公司特定)、纯字母的 10+ 位大写串(英文单词 / {{占位符}})
# 注:下面的模式字面量都用字符串拼接写成,避免本脚本被自己或 denylist 扫到。
set -uo pipefail
DIR="${1:-$(cd "$(dirname "$0")/.." && pwd)}"; DENY=""
shift $(( $# > 0 ? 1 : 0 )) || true
while [ $# -gt 0 ]; do case "$1" in -d) DENY="$2"; shift 2;; *) shift;; esac; done
G=/usr/bin/grep; [ -x "$G" ] || G=grep
hard=0; soft=0
P_GMAIL='@gm''ail\.com'
P_CRA='RT0''00|RC0''00|RP0''00'
P_CO='arc''tura'
scan() { # $1 label, $2 regex, $3 hard|soft, $4 extra grep flags
  local label="$1" re="$2" kind="$3" flags="${4:-}"
  local out; out="$(LC_ALL=C $G -rnE $flags -- "$re" "$DIR" 2>/dev/null | $G -v '/\.git/' || true)"
  local n; n="$(printf '%s' "$out" | $G -c . || true)"
  printf '\n== [%s] %s  →  %s hit(s)\n' "$kind" "$label" "$n"
  [ -n "$out" ] && printf '%s\n' "$out"
  if [ "$n" -gt 0 ]; then [ "$kind" = hard ] && hard=$((hard+n)) || soft=$((soft+n)); fi
}
scan '9 位纯数字 \b[0-9]{9}\b' '\b[0-9]{9}\b' hard
scan 'CRA 程序账户后缀(RT/RC/RP+000)' "$P_CRA" soft
scan '5 位-3 位 \b[0-9]{5}-[0-9]{3}\b' '\b[0-9]{5}-[0-9]{3}\b' hard
scan 'Gmail 个人邮箱域名' "$P_GMAIL" hard -i
# Team-ID 形态:先全量列出,再拆成"含数字(硬)"与"纯字母(软)"
all="$(LC_ALL=C $G -rnoE -- '[A-Z0-9]{10,}\b' "$DIR" 2>/dev/null | $G -v '/\.git/' || true)"
withdig="$(printf '%s\n' "$all" | $G -E ':[A-Z]*[0-9][A-Z0-9]*$' || true)"
alpha="$(printf '%s\n' "$all" | $G -vE ':[A-Z]*[0-9][A-Z0-9]*$' | $G -E '.' || true)"
nd="$(printf '%s' "$withdig" | $G -c . || true)"; na="$(printf '%s' "$alpha" | $G -c . || true)"
printf '\n== [hard] [A-Z0-9]{10}\\b 含数字(Team ID / Enrollment ID 形态)  →  %s hit(s)\n' "$nd"; [ -n "$withdig" ] && printf '%s\n' "$withdig"
printf '\n== [soft] [A-Z0-9]{10}\\b 纯字母(英文大写单词 / {{占位符}})  →  %s hit(s);按 token 汇总:\n' "$na"
[ -n "$alpha" ] && { printf '%s\n' "$alpha" | sed 's/.*://' | sort | uniq -c | sort -rn; printf '%s\n' "$alpha"; }
hard=$((hard+nd)); soft=$((soft+na))
# 真实公司名关键词:允许 SKILL.md 中含「实操样本」的一行
ar="$(LC_ALL=C $G -rniE -- "$P_CO" "$DIR" 2>/dev/null | $G -v '/\.git/' | $G -v 'SKILL\.md:[0-9]*:.*实操样本' || true)"
nar="$(printf '%s' "$ar" | $G -c . || true)"
printf '\n== [hard] 真实公司名关键词(不区分大小写;SKILL.md「实操样本」行例外)  →  %s hit(s)\n' "$nar"; [ -n "$ar" ] && printf '%s\n' "$ar"
hard=$((hard+nar))
if [ -n "$DENY" ]; then
  dl="$(LC_ALL=C $G -rnF -f "$DENY" "$DIR" 2>/dev/null | $G -v '/\.git/' | $G -v 'SKILL\.md:[0-9]*:.*实操样本' || true)"
  ndl="$(printf '%s' "$dl" | $G -c . || true)"
  printf '\n== [hard] denylist(%s;SKILL.md「实操样本」行例外)  →  %s hit(s)\n' "$DENY" "$ndl"; [ -n "$dl" ] && printf '%s\n' "$dl"
  hard=$((hard+ndl))
fi
printf '\n==== SUMMARY: hard=%s soft=%s ====\n' "$hard" "$soft"
[ "$hard" -eq 0 ]
