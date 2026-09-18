# Apple Developer Support — 个人→组织转换请求邮件(模板)

> 入口:developer.apple.com → Contact Us → Membership → Program Enrolment(邮件通道)。**从 Apple ID 邮箱发**,后续所有回复同线程、主题带 case number。正文**不放网址链接**(Gmail MCP 会包成跳转;写裸域名时也让用户发前重敲),见 `references/13-claude-execution-playbook.md` §3。

**Subject:** Request to convert Individual membership to Organization — Team ID {{TEAM_ID}}

Hello Apple Developer Support,

I am the Account Holder of an Individual Apple Developer Program membership (Team ID {{TEAM_ID}}, Apple ID {{APPLE_ID_EMAIL}}). I have incorporated a company and would like to **convert this existing membership in place to an Organization membership**, keeping the Team ID, certificates, identifiers and my published app(s) intact.

Organization details:
- Legal entity name: {{COMPANY_LEGAL_NAME}} (corporation, Province of Ontario, Canada; incorporated {{INC_DATE}}; Ontario Corporation Number {{OCN}})
- D-U-N-S Number: {{DUNS}} (issued by Dun & Bradstreet on {{DUNS_DATE}}; it may still be propagating to your lookup)
- Address: {{REGISTERED_ADDRESS}}
- Phone: {{COMPANY_PHONE}}
- Website: {{DOMAIN}}
- Work email on the organization's domain: {{founder}}@{{DOMAIN}}
- My role: Founder, sole Director, President & CEO — I have the legal authority to bind the organization.

I can provide the Certificate and Articles of Incorporation and any other documentation you need, and I am available for a verification call at the phone number above.

Thank you,
{{FOUNDER_NAME_TITLECASE}}

---

## 回复 Apple 三项核验(同线程)
Hello {{Agent}}, thank you. Answering your three questions:
1. Yes — I am the founder and legal representative of the organization.
2. Legal entity name (Roman characters): {{COMPANY_LEGAL_NAME}}
3. D-U-N-S Number: {{DUNS}}
{{其余实体信息重述一遍}}. I would like the in-place conversion of my existing Individual membership rather than a new enrollment. Please let me know the next step.

## 催办(3 个工作日无回)
Following up on case {{CASE_NUMBER}} (my reply of {{DATE}}). The D-U-N-S Number {{DUNS}} was issued on {{DUNS_DATE}} and should be visible in your lookup now. I can upload the Certificate and Articles of Incorporation, a director's resolution, or take a verification call at {{COMPANY_PHONE}}. Could you confirm the status and what you need from me next?

## 迁移确认回信(Apple 说可以开始)
Thank you — please proceed with converting Team ID {{TEAM_ID}} to the Organization membership for {{COMPANY_LEGAL_NAME}}. Two-factor authentication is enabled on the Account Holder's Apple Account. I understand that certificates, identifiers and profiles may be unavailable during the conversion.
