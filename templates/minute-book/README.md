# Minute Book 模板(占位符化)

| 文件 | 签字 | 何时签 |
|---|---|---|
| 01-bylaw-no-1.md | 董事 ENACTED / 股东 CONFIRMED | 注册当晚(董事)/ 股本入账日(股东) |
| 02-organizational-resolutions-director.md | 董事 | 注册当晚 |
| 03-shareholder-resolutions.md | 股东 | 股本入账日 |
| 04-share-certificate.md | 高管 | 股本入账日 |
| 05-registers.md | 无 | 持续维护 |
| 06-isc-register.md | 无 | 每年复核;**私密** |
| 09-ip-assignment-founder.md | 转让人 + 公司 | 股本入账日(执行日期手写) |
| 10-shareholder-loan-resolution.md | 董事 | 首笔转账之前 |
| 11-officer-appointment.md | 董事 + 被任命人 | 任命时 |
| nda-ip-assignment-worker.md | 公司 + 员工 | 入职日 |
| signing-pack-skeleton.html | — | 用 `scripts/html2pdf.sh` 出 PDF;同时出 clean 版 |

占位符:`{{COMPANY_LEGAL_NAME}}` `{{OCN}}` `{{INC_DATE}}`(如 August 23, 2026)`{{REGISTERED_ADDRESS}}` `{{FOUNDER_NAME}}`(大写法定拼写)`{{CLOSING_DATE}}`(股本入账/交割日)`{{BANK_NAME}}` `{{FYE}}`(December 31)`{{LOAN_CAP}}` `{{OFFICER_NAME}}` `{{OFFICER_TITLE}}` `{{WORKER_NAME}}` `{{EOR_LEGAL_NAME}}` `{{APP_NAME}}` `{{DOMAIN}}`。
