# ca-company-setup — Claude Code skill

从零注册并运营一家加拿大(安省)科技公司的完整作业手册:立项与命名(NUANS)、Ontario Business Registry 注册、Minute Book、CRA BN/GST-HST、公司银行、官网与企业邮箱、CGL/E&O 保险、EOR 雇员与招聘证据、Stripe/Helcim 收款、Apple Developer 个人→组织迁移(D-U-N-S、App Store Connect 税表与银行)、簿记凭证、海外子公司筹办;附 Claude 代办边界、占位符模板、真实项目的 58 条坑与时间/费用基准。

A Claude Code skill distilled from a real 2026 Ontario one-person software company launch (24 days from name search to App Store revenue under the corporation). Entry point: [`SKILL.md`](SKILL.md).

## Install

```bash
git clone https://github.com/RyanSun1991/ca-company-setup.git ~/.claude/skills/ca-company-setup
```

Then invoke `/ca-company-setup` in Claude Code, or just describe any step of setting up a Canadian company — the description triggers automatically.

## Layout

- `SKILL.md` — how to use, phase table, dependency graph, hard rules, index
- `references/` — one file per phase (00 intake … 12 subsidiary) plus execution playbook, record-keeping conventions, decision log, pitfalls, timeline benchmark
- `templates/` — placeholder-ised minute book, letters, call scripts, ledgers, CSV logs
- `scripts/html2pdf.sh` (Chrome headless PDF), `scripts/check-sanitized.sh` (sensitive-data scan)

All figures are 2026-08/09 Ontario observations; re-verify against official pages before relying on them. Not legal, tax or immigration advice.
