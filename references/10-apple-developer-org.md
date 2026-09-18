# 10 · Apple Developer 个人→组织迁移:D-U-N-S、支持工单、enrollment、撤回与补件、ASC 税表/银行/协议、DSA trader、Part XX、收入归属起点

## 目标
把已上架 App 的**个人**开发者账户原地转换为**公司组织**账户(Team ID、证书、APNs、Sign in with Apple、App 全部不动),迁移完成当天 App Store Connect 的协议 / 税表 / 银行 / 合规全部 Active,自当日起 App 收入直接结算到公司账户。

## 前置条件(三要件 + 一堆配套)
- **法人**:Certificate + Articles PDF;公司信息表。
- **D-U-N-S 号码**(D&B,免费,加拿大 1 工作日)。
- **公开可访问的官网**(HTTPS,内容与公司一致)——Apple 会核,404 = 撤回。
- 公司电话(可接 Apple 来电核验)、公司域名工作邮箱(收验证码)、Apple ID 邮箱(支持工单同线程回复)。
- 银行账户(05)、BN + RT 账户(04)——迁移通过后填。
- 官网隐私政策/条款主体已改为公司(06)。

## 步骤

### 1. 路线选择:原地转换 vs 新开组织账户 + App Transfer
| | 原地转换(选) | 新组织账户 + App Transfer(废弃) |
|---|---|---|
| Team ID / 证书 / APNs key / Provisioning | 保留 | 全部重建 |
| Sign in with Apple 用户 | 不受影响 | 需 transfer identifier 迁移(工程量最大) |
| 未上架 App | 一并转 | 不可转移 |
| 政策 | Apple 官方支持,须联系 Developer Support | 标准流程 |
结论:有已上架 App、尤其用了 SIWA → 原地转换。

### 2. D-U-N-S
- D&B 免费申请(dnb.com 的 D-U-N-S Request Service;Apple 也有 developer.apple.com/enroll/duns-lookup 查询入口,需 Apple ID 登录)。申请门户具体页面档案未记录,执行时先截图确认;**✋ 验证码/身份确认由用户做**。
- 真实项目:提交后 **1 个工作日**出号,D&B 邮件 "Verified through outside sources",附 case number;档案显示 Employees 1 · Corporation (CA) · Active。
- 新号在 Apple 查询库同步可能滞后数天;D&B 档案地址 = 日后 Apple DSA trader 页面公开的地址(改地址要经 D&B)。

### 3. 支持工单(Case)
- 入口:developer.apple.com → Contact Us → **Membership → Program Enrolment**(邮件通道)。
- 内容:Team ID、法定实体名、公司号、D-U-N-S(注明新签发可能仍在同步)、注册地址、公司电话、官网、公司域名邮箱、请求 "convert my Individual membership to an Organization membership in place"。
- Apple 回信(1–2 天)通常先要三项:①是否创始人/法人代表 ②法定实体名(罗马字符)③D-U-N-S → **从 Apple ID 邮箱同线程回复**,主题带 case number,逐项答 + 重申原地转换。
- **静默 1–2 周属常见**("large volume of requests");3 个工作日无回 → 同线程催办信(重述答复、点明 D-U-N-S 已发 N 天应已同步、主动提供注册证书/董事决议/接听核验电话、问 case 状态与下一步);再无回 → ✋ 拨 Developer Support 热线报 case 号;来电核验话术见 `templates/letters/apple-verification-call-script.md`(数字速查卡 + 英文问答 + 两个岔路:坚持 conversion 不开新户 / D-U-N-S 同步中请挂起复查不重开 case + 反诈)。
- Apple 确认可开始后回信 "please proceed",Apple 系统邮件引导到 developer.apple.com/enroll。

### 4. 迁移前 ✋ 清单
1. 开发者 Apple Account 开启双重认证。
2. **导出迁移前全部历史报告**(App Store Connect → Sales and Trends / Payments and Financial Reports,CSV/PDF)→ `08-Apple迁移/个人期报告/`——迁移后个人期报告不可查,这是个人所得税依据。
3. 银行:个人账户不动;完成后再换公司账户与税表。
4. 迁移期间证书/标识/描述文件门户不可用(通常数天):先建好近期要用的证书与 Provisioning Profile;测试/发版计划避开该窗口。

### 5. Enrollment(developer.apple.com/enroll,组织信息)
- 表单字段(档案记录):法定实体名、D-U-N-S(实时校验)、官网、公司电话、**签署权声明**(申请人有权代表组织签法律协议)、**工作邮箱验证码**(公司域名邮箱)。提交后得 Enrollment ID,页面 "Once we verify your authority to sign legal agreements, we'll email you with instructions…"。
- **撤回案例**:提交当晚 Apple 邮件撤回 "website must be publicly available, functional" → 官网仓库被设 Private 致 Pages 404 → `gh repo edit --visibility public` + 重建 Pages → apex 200 后**重新提交得新 Enrollment ID**(www 子域 404 不影响,填的是 apex)。
- **补件要求**(常见):①申请人政府签发带照片证件 ②申请人在职/授权证明 ③公司文件(注册证明/Articles/CRA BN 证明任一)。上传入口 developer.apple.com/contact/file-upload(每份 ≤5MB,JPG/PNG/TIFF/PDF,备注 ≤200 字;**提交后不能追加**)。准备:`qpdf` 合并 Certificate + Articles 为一份 PDF;**Employment and Signing Authority Verification 信**(公司信头;表格:Legal entity / Registered office / BN / D-U-N-S / Individual / Positions held / Ownership / Work email & phone / Signing authority;`/s/` 电子签 + "Signed electronically on <date>";模板 `templates/letters/employment-signing-authority-letter.html`,用 `scripts/html2pdf.sh` 出 PDF);证件由 ✋ 用户上传。页面 "Your documents are being processed" → 次日审核通过邮件 → ✋ 用户确认迁移。

### 6. 迁移通过后:App Store Connect → Agreements, Tax, and Banking(Claude 代填到"用户须亲自点"处)
1. **Business** 下出现新法人(旧个人法人并列保留);Paid/Free Apps Agreement 状态 **Pending (New Legal Entity)**;首页横幅 **"Developer Information Update In Process — until it's complete, the updated Program License Agreement may not go into effect"** = Apple 后台仍在切换法人,此时**没有 Agree 按钮**,等即可(真实项目数小时)。
2. **Canadian GST/HST Form 506**:BN + RT 0001 → ✋ 勾 "I certify…" + Submit。
3. **U.S. Tax Questionnaire → Substitute Form W-8BEN-E**:非美国税务居民、无美国经营活动;Part I 实体类型 **Corporation**、**Foreign TIN = BN**;Part III 勾 14a 加拿大居民、14b **LOB = Company that meets the ownership and base erosion test**;15:**Article XII, paragraph 3、0%、Income from the sale of applications**,解释软件使用费在加美税收协定下免美国预扣 → ✋ 勾伪证声明 + "有权签署" + Submit。
4. **U.S. Certificate of Foreign Status of Beneficial Owner**(Apple 简式):实体类型 Corporation、无美国雇员、无美国资产、签署人姓名 + 头衔(President & CEO)→ ✋ Submit。三份互不矛盾:W-8BEN-E 走协定 0%,Certificate 声明无美国经营。
5. **Add Bank Account**:Canada / CAD / 户名 = **公司法定名(与法人一致)** / Corporation / 地址同法人 / 昵称 / **Transit 填 9 位 EFT(`0` + 机构号 3 位 + 分行号 5 位)**——表单自动显示银行名与分行地址即验证通过 → ✋ 填账号 + Next + 确认 → Active。
6. 横幅消失后 Paid Apps 行出现 **"View and Agree to Terms"** → ✋ Account Holder 接受(可能先填联系人)→ Paid Apps **Active**(有效期到下一续费日),Free Apps(= Program License Agreement)随之 Active。
7. **Compliance**:Digital Services Act(欧盟 27 国)— 选 **"I'm a trader under the DSA"** 才能在欧盟分发,Apple 会在欧盟商店 App 页公开 trader 联系方式(地址取自 D&B、电话、邮箱)→ **核对全部为公司信息**(注册地址 / 公司电话 / hello@),无个人信息;**Part XX of the Income Tax Act**(加拿大数字平台申报,Apple 要求的合规信息)填 Active。
8. developer.apple.com/account 显示 Entity = 公司 / Enrolled as Organization / Team ID 不变 / 续费日(年费 C$119)。

### 7. 结算与会计口径
- Apple 财务月结束后 **45 天内**付款;CAD 起付额极低(档案记录 CAD 0.02);各币种由 Apple 银行折成 CAD 单笔汇入。
- **迁移完成日 = App 收入归公司的起点**(与 IP 转让协议的过渡期收入条款对齐:purchase date ≥ Effective Date 归公司),交会计师作为 IP/业务转入公司的对齐点。
- 公司 RT 号与 GST/506 只配置在**以公司为签约主体的组织账户**上;迁移前个人账户收入按个人处理;Apple 平台销售在公司 GST 申报中的呈报口径(代理人模式)由会计师定。
- 迁移前个人开发者时期若有个体户 GST 账户,收入停止后关户(04)。

### 8. 主体切换收尾(迁移后 1–2 天)
- 卖家名自动变公司;检查 App 页隐私/支持 URL 指官网;ASC 版权行 "<year> <Company>";审核联系人用公司电话与域名邮箱;两 App 的隐私政策/条款版本更新(删"转移期间卖家可能显示个人"字句);旧个人 GitHub Pages 法务页改跳转桩(曾公开个人住址);ASC 用户角色(员工/监督人);Google Play 若有,同步组织账号。
- 结构性遗留清单(不阻塞但要记):代码仓库 / Firebase-GCP / Expo / Supabase / Sentry 仍在个人账号;签名证书名仍个人(下次轮换换组织名);邮箱转发个人 Gmail;域名无 DKIM/DMARC。

## 观测到的时长与费用(2026-08/09)
| 项 | 值 |
|---|---|
| D-U-N-S | 08-24 提交 → 08-25 出号(1 工作日),$0 |
| Case 提交 → Apple 首回 | 08-26 → 08-27 |
| 答复 → Apple 确认可迁移 | 08-28 → 09-13(**16 天**,含两封催办) |
| Enrollment → 撤回 → 重提 → 补件 → 通过 | 09-14 一天内三步 → 09-15 通过 |
| ASC 税表/银行/协议全部 Active | 09-15 当天 |
| 从 D-U-N-S 到收入归公司 | **22 天**;年费 C$119(续费日不变) |

## ✋ 用户本人必须做
- D-U-N-S 申请验证码;Apple ID 登录与 2FA;接 Apple 核验来电;上传证件;确认迁移;三份税表的 certify/Submit;银行账号录入;接受 Paid Apps Agreement(Account Holder);DSA trader 选择;导出个人期报告。

## 验证 / 证据
- 台账账号行:Team ID、法人 ID、Enrollment ID、case number(私有仓库可记;对外文件不写)、迁移完成日、续费日、协议有效期、银行状态、税表状态、合规状态、结算规则。
- `08-Apple迁移/迁移前后清单.md`:进度按日记录;补件文件 PDF/HTML 归档;个人期报告目录。
- 总控:阶段行标完成;"自 <date> 起 App 收入归公司" 一句给会计师。

## 坑与检查项
- ☐ 走"新账户 + App Transfer" → SIWA 迁移巨坑;原地转换。
- ☐ 官网仓库 Private → Pages 404 → 撤回;提交前 `curl -I https://<domain>` 200。
- ☐ 用 Gmail MCP 起草回复 Apple → URL 被包成 google 跳转、update_draft 脱离线程(见 13);正文少放网址,发前用户重敲。
- ☐ 补件一次性:三份齐了再提交。
- ☐ 5 位 transit 被拒 → 9 位 EFT。
- ☐ 银行户名与法人不一致 → 拒;用法定名。
- ☐ 看不到 Agree 按钮就催 Apple → 是横幅期,等。
- ☐ W-8BEN-E 忘填协定条款 → 30% 美国预扣;Article XII(3)、0%、sale of applications。
- ☐ 迁移前没导出个人期报告 → 个人报税缺依据。
- ☐ DSA 默认 non-trader → 欧盟不可分发;选 trader 前核对公开联系方式无个人信息。
- ☐ 把公司 RT 号填进个人账户税务档案 → 只能在组织账户。

## 来源
- 档案:`08-Apple迁移/迁移前后清单.md`、`01-Apple来电核验话术.md`、`<Company>-Employment-Verification-*.html`(结构);`00-项目总控.md` 阶段 7;`03-公司治理/09-IP-Assignment-Founder.md` §5;`01-决策与名称/账号与订单台账.md`(结算规则);memory `canada-company-registration.md`(废弃路线)。
- 官方:Apple Developer Support https://developer.apple.com/contact/ ;Enrollment https://developer.apple.com/enroll/ ;D-U-N-S lookup https://developer.apple.com/enroll/duns-lookup/ ;文件上传 https://developer.apple.com/contact/file-upload/ ;D&B D-U-N-S https://www.dnb.com/duns.html ;Apple "Agreements, Tax, and Banking" 帮助(ASC Help);加美税收协定 Article XII(3)——档案引用,未二次核实。
