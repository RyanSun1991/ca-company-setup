# 05 · 公司银行账户:线上被拒→分行预约、面谈手册、股本入账、股东借款、e-Transfer、SWIFT、加拿大账号格式

## 目标
注册后 3 天内开出公司 Chequing 账户,当天存入股本,拿到 institution / transit / account 三个数,解锁 Minute Book 交割、CRA direct deposit、EOR 付款、收款通道绑定与 Apple 银行表单。

## 前置条件
- Certificate + Articles PDF(打印);BN(有更顺,非强制);银行授权决议(03 文件 02 §6,打印并签署,银行名要与决议一致)。
- 两件有效证件(护照 + 工签/省驾照);SIN(口头);$100 股本现金或个人账户转账。
- 注册办公地址证明(虚拟地址收据可作辅助)。

## 步骤

### 1. 线上申请(会被拒,但值得先试 10 分钟)
- 真实项目:BMO 线上 **Business Xpress** 申请 → 风控转介面谈("公司注册次日,外部 KYB 数据未同步";其注册处查验其实已能拉到公司记录)。属正常,不是资料问题。
- 表单自动化技巧(BMO):Shadow DOM 内真实 input;JS `.click()` / 原生 setter + input 事件可靠;芯片题 name 动态编号需按 id 抓。
- 被拒即转分行预约:bmo.com → Book a Branch Appointment(选 Business account opening),拿**预约参考号**;改期/取消 = Find my appointment(邮箱 + 参考号)。选用户日常活动区域的分行。

### 2. 面谈手册(中英对照,发到用户手机;模板 `templates/letters/bank-interview-handbook.md`)
- 随身:两件证件、Certificate + Articles 打印、银行决议打印(已签)、手机里全部 PDF、$100、知道 SIN。
- 开场:"Hi, I have a <time> appointment with <manager>. Reference number <ref>. I'm opening a business account for my corporation."
- 报数据:法定名 / OCN / BN(9 位根号;program account 就说 corporate tax RC)/ 成立日 / 地址 / 业务("Software — we make mobile apps", NAICS)/ 角色("sole director, sole shareholder, and President. I own 100%")/ 雇员("Just me for now")。
- KYC 标准答案:做什么(App 订阅,Apple 每月打款 CAD)、钱从哪来(Apple Canada;App 正迁入公司,几个月后开始)、预期流水(< $5k/月起步,电子、无现金)、国际电汇(无常规;Apple Canada)、首笔存款来源(个人储蓄;$100 股本;日后股东借款)、是否只为本公司用(是,无第三方)。
- 主动提 5 件:① 要 **Essential Business Account($5/月,电子交易无限 + 6 笔免费 e-Transfer)**;② 网银 + 商业借记卡;③ 开 **Interac e-Transfer**;④ **"Can you write down the transit number, institution number, and account number for me?"**(最重要——Apple/CRA/EOR 都要);⑤ 今天存 $100。
- 推销:无年费商业返现 Mastercard **可以要**(订阅扣款公私分离;个人担保正常);有年费卡/透支/投资/保险全拒("Not today, thanks")。
- 会签:账户协议、签字卡(以 **President** 身份)、FATCA/CRS 税务居民声明(加拿大税务居民 + SIN)、受益所有人声明(100%)。
- 卡壳句:"Sorry, could you speak slowly?" / "Could you write that down?" / "Let me check my documents."
- 若银行要 Corporation Profile Report:OBR 在线 $8 即时。

### 3. 散会后三件事
1. 把 **Institution(3 位)/ Transit(5 位)/ Account(7 位)** 发给 Claude → 台账"关键凭据"(账号可写,**网银密码/借记卡号不写**)、公司信息表。
2. 确认 **$100 股本当日入账** → 当晚补签 Minute Book 交割 5 处(03 §6)。
3. 从 BMO 网银下载 **void cheque / Direct deposit form PDF**(Account details → Void cheque / Direct deposit form)——Helcim 绑行、EOR 都可能要。

### 4. 股东借款注资(运营资金)
- 先签借款决议(03 §4)→ 个人账户 e-Transfer 到公司 Chequing,备注 "Shareholder loan" → 台账加一行。
- **Autodeposit**:公司账户在网银开 Autodeposit 绑公司别名邮箱(如 `billing@{{DOMAIN}}`,单笔上限 $25,000),付款方 e-Transfer 时会显示公司法定名(实名核验)——这也是收 B2B 客户 e-Transfer 的方式。
- 付供应商:公司 Chequing e-Transfer 到对方付款邮箱(对方 Autodeposit 显示其法定名 = 三角核验:账户名 = 签约主体、BN 与政府登记一致、银行代码正确),备注发票号。

### 5. 加拿大账号格式与各系统填法
| 系统 | 要什么 | 填法 |
|---|---|---|
| CRA direct deposit | institution(3)+ transit(5)+ account | 三段分填 |
| EOR / 供应商 e-Transfer | 邮箱 + Autodeposit | 不需要账号 |
| Stripe / Helcim 绑行 | transit-institution / account 或上传 void cheque | Helcim 手动 = **纯上传文件**(void cheque / direct deposit form / 带 transit+account 的银行函,PDF/JPG/PNG ≤5MB),2 工作日人工绑定;Plaid 需网银借记卡号+密码交第三方,公司账户可能连不上 |
| **Apple(美式系统)** | "Transit"(9 位)+ Account | **9 位 EFT 格式 = `0` + 机构号 3 位 + 分行号 5 位**(示例:机构号 `001`、分行号 `12345` → 连写 `0 001 12345`,录入时去掉空格);表单自动解析出银行名与分行地址即表示验证通过 |
| 国际汇款 | SWIFT/BIC(银行级,如 BMO 为 8 位以 BOFM 开头——以银行官网为准)+ transit + account | 仅 Apple 之外的海外汇款用 |

### 6. 商业信用卡
- 开户时申请无年费返现卡;批卡后把虚拟地址、域名、订阅扣款迁到公司卡(11 阶段的"抬头/税号/付款/用途四一致")。
- 未批前用个人卡垫 + 月度报销单(ETA s.175)。

## 观测到的时长与费用
| 项 | 值 |
|---|---|
| 线上申请→被拒 | 注册次日,10 分钟 |
| 分行预约 | 2 天后(08-24 预约 → 08-26 面谈 1 小时) |
| 账户月费 | Essential $5/月;e-Transfer 6 笔/月免费 |
| 股本 | $100 当日入账 |
| 从注册到有账户 | **3 天** |

## ✋ 用户本人必须做
- 到分行面谈(证件、SIN、签字卡、FATCA/CRS);存股本;网银首次登录与密码;Autodeposit 设置;每笔 e-Transfer 的发送(付款类动作不代办);信用卡申请。

## 验证 / 证据
- 台账"关键凭据":Institution / Transit / Account、SWIFT、开户日、股本入账日。
- 借款台账与银行流水一致。
- 供应商付款三角核验记录(Autodeposit 显示名 + 对方 BN 政府库核对)。

## 坑与检查项
- ☐ 线上被风控拒当成失败 → 正常,转分行。
- ☐ 决议里银行名与实际开户行不一致 → 面谈前改决议(真实项目 §6 从别家改成 BMO 版)。
- ☐ 没当场拿到 transit/institution/account → 后面每个系统都卡;面谈必问第 ④ 条。
- ☐ Apple 表单填 5 位 transit 被拒 → 9 位 EFT 格式。
- ☐ 把网银凭据交给 Plaid 类第三方 → 用上传文件路径。
- ☐ 公司账户给个人垫钱 → s.15(2) 风险;方向永远个人→公司。
- ☐ 用本人卡在自家收款通道刷测试款 → 商户协议禁止;股东注资走银行转账。
- ☐ 账户余额跌破下一张周发票 → 总控"现金与跑道"行每周看一眼(真实项目押金付完只剩 ≈$183)。

## 来源
- 档案:`03-公司治理/07-BMO开户面谈手册.md`、`00-MinuteBook-索引与开户清单.md`;`01-决策与名称/账号与订单台账.md`;`08-Apple迁移/迁移前后清单.md`(9 位 transit);`10-支付/01-收款通道申请准备包.md`(绑行方式);memory `canada-company-registration.md`(BMO 表单自动化)。
- 官方:BMO Business accounts 与 Book a Branch Appointment(bmo.com,档案记录,未二次核实页面路径);Payments Canada EFT 9 位格式惯例(0 + 机构 + 分行)——档案实测,Apple 表单验证通过。
