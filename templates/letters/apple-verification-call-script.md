# Apple 开发者账户转换 — 来电核验话术(照读)

> 背景:已提交 Case {{CASE_NUMBER}} 申请把 Individual 会员转换为 Organization({{COMPANY_LEGAL_NAME}})。Apple 可能打 {{COMPANY_PHONE}} 核验(来电显示可能是美国号码)。原则:**如实答;你要的是 "conversion"(原地转换),不是新注册;不谈移民身份。**

## 🔢 数字速查卡
| 项 | 值 |
|---|---|
| Case ID | {{CASE_NUMBER}} |
| Apple ID(账户邮箱) | {{APPLE_ID_EMAIL}} |
| Team ID | {{TEAM_ID}} |
| 公司法定名 | {{COMPANY_LEGAL_NAME}}(逐字母拼读) |
| 实体类型 | Corporation(Canada / Province of Ontario) |
| 安省公司号 | {{OCN}},成立 {{INC_DATE}} |
| D-U-N-S | {{DUNS}}({{DUNS_DATE}} 签发) |
| 地址 / 官网 / 域名邮箱 | {{REGISTERED_ADDRESS}} / {{DOMAIN}} / {{founder}}@{{DOMAIN}} |
| 你的职务 | Founder, sole Director, President & CEO |
| 在售 App | {{APP_NAME}}(Apple ID {{APP_STORE_ID}}) |

## 📞 开场
> "Hi, yes — this is {{FOUNDER_NAME_TITLECASE}}. I submitted case {{CASE_NUMBER (逐位)}} to convert my individual Apple Developer Program membership to an organization membership. Happy to verify anything you need."

⚠️ 反诈:对方开口要**验证码、密码或付款** → 不是 Apple,挂断。

## ❓ 高频问答
- **Name and Apple ID?** "{{FOUNDER_NAME_TITLECASE}}, and the Apple ID is {{APPLE_ID_EMAIL}}."
- **Legal entity name?** "{{COMPANY_LEGAL_NAME}} — that's {{逐字母}}."
- **Entity type / where registered?** "A corporation, incorporated in the Province of Ontario, Canada, on {{INC_DATE}}. The Ontario Corporation Number is {{OCN 逐位}}."
- **D-U-N-S Number?** "{{DUNS 逐位}}. It was issued by Dun & Bradstreet on {{DUNS_DATE}}, so if your lookup doesn't find it yet it may still be propagating."
- **Are you authorized to bind the organization to legal agreements?**(必问)"**Yes. I am the founder, the sole director, and the President and CEO of the corporation. I have full legal authority to bind it.**"
- **Address / phone / website?** "{{REGISTERED_ADDRESS}}. Phone is this number. The website is {{DOMAIN 逐字母}}."
- **Email on the organization's domain?** "Yes — {{founder}}@{{DOMAIN}}. The account's Apple ID is currently my personal email; happy to keep or update it, whichever your process prefers."
- **Why converting?** "The business has been incorporated, and the apps and IP now belong to the corporation, so the membership should reflect the correct legal entity."
- **Do you understand what happens after conversion?** "Yes — the membership entity becomes the corporation, the seller name changes to {{COMPANY_LEGAL_NAME}}, and the Team ID, certificates and existing app stay in place. That's exactly what I want."
- **Documentation?** "Absolutely — I have the Certificate and Articles of Incorporation as PDFs. Where should I upload or email them?"

## 🛡️ 两个岔路
**岔路 1:"You can enroll a new organization account."**
> "I'd prefer **not** to create a separate account — I'd like the **in-place conversion** of my existing individual membership, keeping Team ID {{TEAM_ID}} and my published app intact, so users and Sign in with Apple are unaffected. My understanding is Developer Support can process this as an entity conversion. Could you route this to the team that handles membership conversions?"

**岔路 2:D-U-N-S 查不到**
> "Understood — the number was issued on {{DUNS_DATE}} and may still be syncing to your systems. Could we note the case and re-check in a couple of business days? I don't want to restart the request."

## 📝 挂电话前必做
1. "What's the next step, and is there anything you need from me by email?"
2. 记下任何新 Case/参考号。
3. 回来把要点发 Claude:需要什么文件、时间线。

## 附:邮件回复而非电话 → 直接转给 Claude 起草;登录/付款步骤你来点。
