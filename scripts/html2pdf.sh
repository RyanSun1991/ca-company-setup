#!/usr/bin/env bash
# html2pdf.sh — 用 Chrome headless 把签署打印包 / 证明信 HTML 渲染成 PDF(Letter,无页眉页脚)。
# 用法:
#   scripts/html2pdf.sh <in.html> <out.pdf>            # 原样(屏幕上的黄底说明框由 @media print 自动隐藏)
#   scripts/html2pdf.sh <in.html> <out.pdf> --clean    # 先删掉 class="note" / "screen-note" 元素,出"干净版"给对方签
# 页边距、纸型由 HTML 内 @page 控制(建议 `@page { size: letter; margin: 20mm }`)。
set -euo pipefail
IN="${1:?in.html}"; OUT="${2:?out.pdf}"; MODE="${3:-}"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[ -x "$CHROME" ] || CHROME="$(command -v google-chrome || command -v chromium || true)"
[ -n "$CHROME" ] || { echo "Chrome not found; set CHROME=/path/to/chrome" >&2; exit 1; }
SRC="$IN"
if [ "$MODE" = "--clean" ]; then
  SRC="$(mktemp -t signpack).html"
  # 删除带 note / screen-note class 的 div(单行或多行),其余原样
  perl -0pe 's#<div class="(?:note|screen-note)"[^>]*>.*?</div>\s*##gs' "$IN" > "$SRC"
fi
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$OUT" "file://$(cd "$(dirname "$SRC")" && pwd)/$(basename "$SRC")" >/dev/null 2>&1
[ "$MODE" = "--clean" ] && rm -f "$SRC"
echo "wrote $OUT ($(du -h "$OUT" | cut -f1))"
# 相关:合并 PDF → qpdf --empty --pages a.pdf b.pdf -- merged.pdf ;SVG→PNG → rsvg-convert -w 1024 -h 1024 in.svg -o out.png
