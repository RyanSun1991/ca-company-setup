# 08 · 招聘与 EOR:直雇 vs 挂靠、询价谈判、合同包审阅、押金与周发票、NDA-IP 直签、招聘证据包、工作记录制度、SR&ED 记录

## 目标
从"决定要人"到"首名员工开工并有工时→发票→付款闭环":2 周。所有雇佣合规由 EOR(employer of record)承担,公司只指挥工作、付服务费;同时把 SR&ED 与移民材料所需的证据链从第一天起留好。

## 前置条件
- 官网 careers 页 + LinkedIn 帖(职位发布证据锚点,见 06)。
- 公司账户可 e-Transfer(05);`partnerships@` 可发件(06);CGL 保险能在开工前出单(07)。
- Intake E1–E5:岗位性质、时薪、工时、开始日、监督人。

## 步骤

### 1. 直雇还是 EOR(先算 SR&ED)
- **研发主力 → 直雇**:软件业安省 WSIB 非强制、EHT $1M 免税、RP 账户几分钟开、Wagepoint 类工具 $25–60/月;SR&ED 挂靠员工只算 **80%** 合同支出且**丧失 55% proxy 加成**——每 $10 万研发工资,挂靠比直雇每年少拿约 **$2.1 万联邦**(含安省 ≈$2.5 万),远超挂靠费(CRA Contract Expenditures Policy §12;Prescribed Proxy Amount Policy §4)。
- **EOR 只适合**:非研发岗 / 超短期 / RP 账户就绪前过渡 / 不想碰雇主合规。
- 法律:安省 ESA Part XVIII.1,THA 是法定雇主,员工是 assignment employee,客户保留日常指挥权;客户对派遣员工未付工资连带责任(s.74.18);OHSA 安全义务不可外包;**2024-07-01 起 THA/recruiter 须持牌**,客户"明知用无牌机构"罚 $15k–50k → 签约前查 ontario.ca THA 登记库(licensee / applicant)。

### 2. 询价(4 家同发,Deel/Remote 公开价 US$599/人/月 作锚)
- 参数定稿:岗位(非研发)/ 时薪区间 / 30–35h 周(全职,IRCC 口径 30h+)/ 首期 8–12 个月可续 / 2–3 周内入岗 / 远程安省。
- 邮件从 `partnerships@` 发(模板 `templates/letters/eor-rfq-email.md`),10 问:定价结构(markup % vs flat;法定负担 pass-through 是否逐项)/ 最低人数、期限、setup、押金 / **THA 牌照号** / 固定期限与提前终止、终止成本归属 / 文件政策(offer、在职证明信默认只显示 EOR;应员工请求含 title/dates/hours/salary/**按 SOW 的职责描述**)/ IP 转让给客户 + 精神权利放弃 + 不反对直签 NDA / 福利 / 转直雇费用与等待期 / 时间线与账期 / 保险与数据存放;索样本 MSA、雇佣合同、证明信。
- 网站表单版(~900 字符)供无邮箱入口者;HubSpot iframe 进不去可用其表单提交 API 直接递交(记住不要留测试线索)。
- 候选:HQ Simple(费率公开 22%/23%,无最低人数)、Canadian Payroll Services(~US$400/人/月)、TCWGlobal、The Payroll Edge(People2.0 网络,持牌);传统大所 Procom/Altis/Raise/Randstad 备选。

### 3. 谈判轮次(真实项目 HQ Simple 六轮,可复用要点)
| 轮 | 要点 | 结果 |
|---|---|---|
| 2 费率表 | Prepay(预付一个双周发票额)= **18%** · Net 0 = 19% · Net 7 = 20% · Net 15 = 21%;**4% 假期工资叠加在工资上再计 markup** → 综合成本 = 工资 × 1.2272 | 选 18% 预付档 |
| 3 | 问预付机制(滚动押金 vs 逐期预付)、全期锁价、三份样本、保险加保 COI、PIPEDA | 样本到手 |
| 4 签约推进 | 只留两条钱务确认:①锁价覆盖 SOW "30 天可调价"条款 ②按 SOW 算法出账;事务项:THA 号随签约包、开工前 COI、签署方式、入职材料 | 用户决定 THA 不作阻断项 |
| 5 | 首年锁价 ✓(续期降级为"不预期涨");出账算法被拒(假期工资照计 markup,实质损失 0);THA 改称"律师意见:纯 EOR 不适用"(引 Davidson v. T.E.S.——案例真实但读法有争议;**其书面立场 = 我方"非 knowingly 使用无牌机构"的尽职核查证据,存档**) | 进签署 |
| 6 | 人选信息(姓名/邮箱/时薪/开始日/免背景调查) | Adobe Sign 合同 |
- **签约实体验真**:Canada's Business Registries 聚合库查法定名、注册地、Active、跨省注册;首张发票的 GST 号用 CRA 登记库核。公司注册 ≠ THA 牌照。

### 4. 合同包审阅(Services Agreement + Payrolling SOW + 雇佣合同模板 + Offer 模板)
必看条款与真实项目结论:
- 滚动押金:可被划扣 5 日内补足、期末抵扣、30 日内退、无息;**押金不抵周发票**。
- 转直雇:**任何时候零费用零等待**(很多家收 15–25% 年薪)。
- 终止:双方 30 天;首年后转月租;wind-down 时未转直雇的员工由 EOR 解雇、客户承担 ESA 成本。
- 责任上限:12 个月服务费或 $25 万取高;例外欺诈/未上缴代扣税/保密。
- PIPEDA + 48h 泄露通知;精神权利放弃写进 SA 且延伸至客户;"holds the authority and licences needed" 资质陈述(THA 风险的合同保护)。
- **锁价未入文本**:Reservation of Right to Modify Pricing(30 天通知调 markup)+ entire agreement → 邮件承诺法律上被架空;缓冲 = 30 天终止 + 零费转直雇;决定不重开文本(重开风险:对方顺手改假期工资算法)。
- 雇佣合同 = **无固定期限 + ESA 最低标准解约**(Waksdale 后安全写法)——对客户比固定期限**更省**(Howard v. Benson:固定期限提前结束要付满剩余期限);8–12 个月只作 assignment 预估。
- 客户义务:留存自主招聘证据(职位页+面试记录+选人决定,可随时索要);工伤 24h 报;客户提供设备;**工时 2 个工作日不批视同批准**;发票 3 天争议窗 + **Net 7** + 逾期 1%/月;终止/暂停/违约通知须 courier。
- 签署操作:Background Checks 勾 NOT REQUIRED;签名 "<Name> / President & CEO";核对 Exhibit A(Approved Jurisdictions)含 Ontario;Adobe "Completed" 邮件的双签 PDF 立即归档。

### 5. 入职链路(真实时间线)
1. 合同双签(8/31)→ **押金发票**:2 周 × 35h × ($30 × 1.18 = $35.40) + 4% 假期 = $2,577.12 + HST $335.03 = **$2,912.15**;公司 e-Transfer 到 EOR 付款邮箱(Autodeposit 实名 = 签约主体),备注发票号。
2. **intake / referral 表单是客户侧触发器**(hqsimple.com/associate-onboarding:Step1 客户联系人、Step2 hiring manager、Step3 associate 信息:姓名/邮箱/时薪 hourly non-exempt/周工时/开始日/结束日留空 open-ended/telecommuting + 员工家庭住址(只进 EOR 系统)/职责 5–7 条)。**误以为是员工侧表单会导致运营流水线不启动、整天静默**。提交后 <4 小时 EOR 签发 Offer(Humi 电子签)。
3. Offer 条件条款要求随后签 **Employment Agreement**(onboarding 任务,Humi 推送,开工前完成);EA 全文无客户人名字段;**Assignment Information**(ESA s.74.6)由 EOR 单方出具,须**具名**客户监督代表(一人公司 = 创始人;写他人 = 虚假陈述);对外在职证明信可"按头衔"。
4. 填空定稿:Reports to 只写职务 + `partnerships@`;工作地点 **"Remote — employee's home office, <City>, Ontario"**(雇佣合同法律 = 履行地省份;不写 EOR 城市也不写公司地址);职责进 assignment 附表。
5. 工时流程:员工在 Humi 记时、每 pay period 末提交 → EOR 把 timesheet 报告邮件给客户 → **回复邮件确认即付款授权**;双周发薪 CAD;确认人可改(需真人 + 高管任命,见 03 §5)。
6. 周发票(W/E 周五,Net 7):工时 × $35.40 + 4% 假期 + HST;每张核算法、存 `07/EOR合同包` 与 `04/凭证/当季`,ITC 清单加行;总控付款提醒。满周 35h ≈ **$1,456 含 HST**。
7. EOR 发来的 COI 审阅:签发日 / 经纪 / 被保险人 / 承保人 / 保单期 / CGL 每次+累计 / Professional Liability / certificate holder / 取消通知天数;与我方 COI 对等。
8. 我方保险 AI 证书 + COI 发 EOR(07)。

### 6. 直签 NDA-IP(公司 ↔ 员工,不改变 EOR 雇佣关系)
EOR 雇佣合同有"末端客户拥有工作成果"但常缺**精神权利放弃** → 公司与员工直签(EOR 书面不反对):定义 Confidential Information / Work Product;保密 5 年(商业秘密与个人信息无限);IP 转让自创作时生效;精神权利放弃(Copyright Act);PIPEDA 访问最小化与泄露即报;无冲突义务;**第 7 条:仍是 EOR 雇员,不产生与公司的雇佣/报酬关系**;$10 对价;安省法;可电子签。入职日签,双方各执。模板 `templates/minute-book/nda-ip-assignment-worker.md`。

### 7. 招聘证据包(`07-政府项目/招聘证据包/`)
- 00 流水线时间线(每步带可验证锚点:careers commit 哈希 / LinkedIn 帖日期 / 面试日期 / 选人日 / 推荐 EOR 邮件日 / referral record)。
- 01 职位发布证据(渠道、首发时间、验证方式;发布内容摘要;"人选推荐前 N 天已公开发布并持续在招;EOR 未提供任何候选人")+ careers 页线上快照 HTML(HTTP 200)。
- 02 面试记录(候选人 / 职位 / 面试官 / 日期时长 / 形式 / 来源渠道;背景摘要自简历;实际讨论的方面;决定性亮点;1–5 评分表;其他候选人情况;结论;签名)——**如实,不虚构;框架先建,内容待真实对话后填;签字前面试官过目**。
- 03 选人决定备忘(Process summary / Selection rationale / Compensation determination(区间、定薪、依据、工时、8–12 月为业务预期非合同期限)/ Employment structure(EOR 在选定**之后**介入,仅付薪与合规))。
- 04 职责描述(**NOC 口径**;每条必须真实履行;NOC 匹配靠职责不靠头衔;IT 领域 20012 TEER 0 要求"数年经验含监督经验"、Job Bank 安省低位 $45/h,一人公司 + $30/h 是软肋;**21222 TEER 1**(含 IS QA analyst)与 QA/PM 实际工作和工资更贴合;SOWP 只要 TEER 0 **或** 1;顾问定夺)。
- 简历 PDF、LinkedIn 核验(与简历一致;与决策人的人脉关系如实写来源渠道)。
- 以后每次招人照此流水线,每步落一个文件 commit(git 时间戳天然公证)。

### 8. 员工工作记录制度(`12-团队运营/`)
- 三重用途:工时确认与付款依据(Humi ↔ 每日日志逐条对得上)/ 移民材料一致性(日志类别 = 在职证明信 NOC 职责)/ SR&ED 与质量史。
- 记录写在**公司账号**(公司邮箱、公司 GitHub/表格),每天 10 分钟。
- **每日日志 CSV**(`templates/daily-log-template.csv`):date / hours(0.5 步进)/ category(C1–C6 对应 NOC 主职责)/ product_release / task / output / result_metric / notes;月底按类别汇总小时占比 = "她的工作确实是 NOC 描述的那些"的证据。
- 四张台账:缺陷跟踪(GitHub Issues,S1–S4)/ 测试用例库 / **发布日志**(`templates/release-log-template.csv`)/ 质量指标周表。
- 周报模板(周五 17:00 前,发监督人抄创始人):Releases / Defects / Quality / Process / Compliance / Next week / Hours this week / Risks。
- 监督人确认动作(每两周 10 分钟):收 EOR 工时报告 → 对每日日志:小时合计一致、每行有产出链接、无空白日 → 回 "Confirmed" 抄 `partnerships@`;**对不上先问再确认,不要先确认再补记录**。

### 9. 在职证明信(员工移民材料)
由 **EOR 出具**(雇主信头,HR/Director of Operations 签),员工申请,时点 = 递交前(理想有 2–3 张工资单);公司只提供职责文本(按顾问定的 NOC)、职位名/开始日/工时/时薪确认、"汇报线按头衔"。IRCC 核实对象 = 信头雇主;少数情况联系客户(按事实答:经 EOR 派驻、职位、职责、工时、开始日、由 Director 监督);公司无需主动提交材料。EA、Assignment Information、证明信三处职责口径必须一致。

## 观测到的时长与费用(2026-08/09)
| 项 | 值 |
|---|---|
| 调研报告 + 询价发出 | 08-24 → 08-25 |
| 谈判到双签 | 08-25 → 08-31(6 轮) |
| 押金 → Offer → 开工 | 09-01 付押金与 intake → 当晚 Offer → 09-08 开工 |
| 押金 | $2,912.15(2 周,含 HST $335.03 可抵) |
| 周成本 | 35h ≈ $1,456 含 HST;月 ≈ $5.8k;年 ≈ $70k |
| markup | 18%(预付档);4% vacation 在 markup 基数内 |
| 首张周发票 | 19.25h → $800.84(Net 7) |

## ✋ 用户本人必须做
- 面试与选人(真实发生);拍板时薪/开始日/监督人;Adobe Sign 签合同;e-Transfer 押金与每周发票;确认工时(或任命的监督人);向 EOR 发身份/保险类邮件时的最终点击;THA 风险决策。

## 验证 / 证据
- 双签 PDF、押金发票、每张周发票 PDF(两处归档);台账订单行;ITC 清单行。
- 招聘证据包 7 项状态表全 ✅ 并签字;referral record 副本。
- 首两周日志、首份周报、首次工时确认邮件。
- `HQS-<员工>-文件清单与对外使用.md`:12 项文件作用/签署方/状态、私有 vs 可对外、效力层级。

## 坑与检查项
- ☐ 研发岗走 EOR → SR&ED 损失 ≫ 服务费。
- ☐ 没查 THA 登记库就签 → 至少拿到对方书面立场存档。
- ☐ 邮件锁价当合同 → 看文本;缓冲条款要在。
- ☐ **intake 表单以为是员工侧 → 静默一天**;拿到链接当天由客户方填。
- ☐ 押金以为能抵周发票 → 不能,现金要够。
- ☐ 工作地点写 EOR 城市或公司地址 → 雇佣法适用地错;写员工家庭办公室所在省市。
- ☐ Reports to 写了人名又想改 → 只影响 Offer(内部可见),不值得重签;Assignment Information 必具名。
- ☐ 用挂名者当监督人 → 不可;真人 + 任命 + Consent。
- ☐ 面试记录事后编造 → 纪律:只记真实发生的,宁短勿假。
- ☐ NOC 按头衔选 TEER 0 但工资/监督经验不符 → 备 TEER 1 口径,顾问定。
- ☐ 工时 2 工作日不批视同批 → 每周固定核批时间。
- ☐ Adobe Completed 邮件没归档双签 PDF → 收到当天存。

## 来源
- 档案:`07-政府项目/劳务外包EOR挂靠调研.md`、`EOR询价邮件稿.md`(六轮全记录)、`HQSimple合同包/ServicesAgreement.txt`、`HQS-<Employee>-文件清单与对外使用.md`、`员工直签NDA-IP-<Employee>.md`、`招聘证据包/00–04`、`SRED-记录模板.md`;`12-团队运营/01` + 两个 CSV;`00-项目总控.md` 阶段 10。
- 官方:安省 THA 牌照登记 https://www.ontario.ca/page/licensing-temporary-help-agencies-and-recruiters ;ESA Part XVIII.1;IRCC "Find your NOC";Job Bank 工资;CRA SR&ED Contract Expenditures Policy / Prescribed Proxy Amount Policy;HQ Simple 公开费率 https://www.hqsimple.com/pricing/canada 。案例 Davidson v. T.E.S. Contracting Services、Howard v. Benson、Waksdale——档案引用,未二次核实。
