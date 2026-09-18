# 04 · CRA:BN 关联、GST/HST 自愿注册、direct deposit、注册审核回电、首期申报与 ITC 规则、所得税逻辑、薪酬/RRSP/PHSP 结论

## 目标
BN 到手 1 周内:MyBA 关联 → GST/HST(RT 账户)自愿注册、生效日回溯到成立日、季度申报 → direct deposit 绑公司账户;通过 CRA 注册审核来电;建立凭证与 ITC 习惯,首期申报净退款。

## 前置条件
- BN 已回传(02 §3)。
- 公司银行账户(05)——direct deposit 与"银行"问题需要。
- 用户有个人 CRA 凭证(My Account 同一套)。
- 主营业务一句话 + NAICS(与注册、保险、发票一致)。

## 步骤

### 1. My Business Account(MyBA)关联 BN(3 分钟,Claude 可在用户登录后代办)
canada.ca → My Business Account → Sign in(个人 CRA 凭证/银行 Partner)→ **Add a business number / Manage business number** → 输 9 位 BN → 归属确认题(真实项目:"是否已报过 GST/T2" = No,一次通过,零额外验证题)→ 公司卡片出现,RC 程序账户可见。

### 2. GST/HST 注册(RT 程序账户)
**为什么自愿注册**:年应税销售 < $30,000 不强制,但注册后商业开销中的 HST 可作 ITC 退回(虚拟地址、订阅、设备、EOR 服务费、会计师费);纯支出期申报 = 净退款。代价是每季一张 GST34(4 个数),零活动也要报 NIL。

**在线 BRO 会被拦**:选 GST/HST 后弹 "non residence notice"(9 开头临时居民 SIN 触发自动规则),公司其实是安省居民企业。**解法 = 电话 1-800-959-5525**(Business Enquiries,周一至五 8:00–20:00,周六 9:00–17:00 本地时间)。

**IVR 与满线**(真实项目 3 次才通):语言选择后 1=online services / 2=business number / 4=GST/HST account;满线时选 2 或 4 直接报 "service not available at this time" 弹回主菜单 = **甩客**,不是操作错。窗口 A:当天 18:00–19:30;窗口 B:7:58 拨入、8:00 整点选 4,被甩就挂断立刻重拨 2–3 次;避开周一/周二上午、午休、月初。再失败:C 计划传真 RC1A(2–3 周);D 计划会计师经 Represent a Client 代注册。找不到入口就按 0 或连说 "speak to an agent"。

**电话脚本参数**(用户照读;个人敏感信息**口头答,不写进任何文件**):
| 环节 | 答 |
|---|---|
| 开场 | "I'd like to register a GST/HST account for my corporation — I have the Business Number ready." |
| 身份 | BN、法定名、董事姓名;SIN/生日/邮编口头 |
| Effective date | **成立日**(自愿注册可回溯 ≤30 天;把成立当天的 NUANS、地址费都罩进来) |
| Reporting period | **Quarterly**(有 EOR 进项、年 HST ≈$8k 时按季退款;否则 Annual) |
| Fiscal year end | December 31 |
| Estimated annual taxable supplies | 如实低估,如 $10,000 |
| Main business activity | "Software publishing / mobile app development"(NAICS 513210) |
| 若被归 non-resident | "The corporation is resident in Canada — incorporated in Ontario and managed from <city>. I live and work here; only my SIN is the temporary-resident series." 不接受转 non-resident TSO |
| 结尾 | 让对方读出 RT 账号并复述生效日 |

注册当场出号。之后:MyBA "Expected returns" 核实首期(截图存档);**约 1 周**收到书面 "Registration confirmation notice"(生效日、Quarterly、首期区间、截止日、已启用电子申报;缴款 ≥$10,000 须电子支付)。

### 3. Direct deposit(✋ 用户在 MyBA 设,RC 与 RT 两个账户都指向公司 Chequing)
需要 institution(3 位)、transit(5 位)、account。退款直进公司账户。

### 4. 注册审核来电(voluntary + 预期退款 → 重点查真实性)
- 形式:留言(来电显示可能是外省 CRA 税务中心号码),自称 "registration review program",给**回电号 1-866-221-4063 + 4 位分机 + 参考号**。
- **先验真**:canada.ca 联系页列 1-866-221-4063 = "Discuss details of a phone call for your GST/HST or corporate program account registration";用 CRA "Verify it's the CRA calling" 工具查;**不回拨留言里的来电显示号码**;CRA 不要礼品卡/密码/不威胁逮捕。
- 回电:拨通按提示输分机(可加 #);人工则说 "returning a call from the Registration Review Program, extension ____, reference ____";进语音信箱留 BN、参考号、姓名、公司名、回拨号、时段,1–3 个工作日回拨。
- **会问什么**(全部与注册信息、确认信一致、如实):公司做什么(NAICS)/为什么自愿注册(期初开支含 HST、开始开票)/生效日与周期/预计年销售/客户在哪(安省 13%、非居民零税率)/有无雇员(EOR 派驻 ≠ 直雇,无 RP)/经营地址是否实体(注册地址,远程)/银行与 direct deposit/首期预计(销项 0、ITC ≈ $355–625)/主要供应商/是否居民。英文照读稿见 `templates/letters/cra-registration-review-call-script.md`。
- 真实项目结果:通话只核基本信息,**无文件要求**;结尾说 "file" = 按期**申报**。不回电有被撤销注册、首期退款被卡的风险。若被要文件用 MyBA "Submit documents" 附参考号。

### 5. 首期申报(GST34,4 个数;Claude 算,✋ 用户 MyBA → GST/HST → File a return 填)
Line 101 销售额 / 105 销项税 / 108 ITC 总额 / 109 净额(负 = 退款)。截止 = 期末后 1 个月;退款 2–4 周;**首次退款申报常触发"评估前审核"**,来信要发票就 Submit documents。零活动季度交 NIL。

### 6. ITC 规则(哪些能抵、要什么票)
**凭证三档**(Input Tax Credit Information Regulations s.3;ETA 169(4);RC4022;Systematix 2007 FCA 226 判定强制):
| 单张总额 | 必须有 |
|---|---|
| < $100 | 供应商名、日期、金额 |
| $100–$499.99 | + 供应商 GST/HST 号、税额或"含税"字样、应税状态 |
| ≥ $500 | + **收件方名称 = 公司法定名(或经营名/授权代理)**、付款条款、足以识别供应的描述 |

**能抵**:商业活动部分(混用按比例);**资本财产商用 >50% → 抵 100%**(全或无);餐饮 50%;进口货物海关 5% GST 凭报关单;发票日期决定归属期,未付款也可抵;漏抵 4 年内补。
**不能抵**:政府规费(无 HST);美国供应商(无 HST);**保险的 8% 安省 RST**;金融服务免税(银行费、Stripe/Helcim 手续费);生效日前的服务类开销;**美国 SaaS 在"简化登记制"下收的 HST 法定不可抵**(把 RT 号给供应商让其停收;Google Cloud Canada / Microsoft Canada / AWS Canada / Adobe Canada 这类正常登记的可抵);个人名义 ≥$100 大额票有被拒风险。
**个人先垫**:ETA **s.175** 报销规则(雇员/高管为公司业务购买、公司报销 → 公司视同取得,凭个人名收据 + 报销单)或**代理购买**(发票写代理人名);三样留:报销单、用途说明、公司付款记录。
**税号核验**:CRA "Confirm a GST/HST account number"(号 + 名 + 交易日);号无效 ITC 被拒。

### 7. 所得税(T2)逻辑速览
- 所得税看**利润**(ITA s.9/18/67);GST 看**销售额**;工资税看**工资**——三套各走各的,"钱花光了"只免所得税。
- CCPC(税务居民控制)安省:首 $500k 活跃营业所得 **12.2%**(联邦 9% + 安省 3.2%),超出 26.5%;亏损结转 20 年 / 回溯 3 年;亏损也要按时报 T2(财年后 6 个月,附 GIFI)。
- 可扣:工资(合理、实付;年末计提须财年后 **180 天**内付出,s.78(4))、EOR 服务费全额、订阅/云/域名/虚拟办公室/保险/会计/银行与收款手续费、商务比例的手机网络、餐饮 50%、成立费首 $3,000 当年扣(余入 Class 14.1)、SR&ED 支出(另拿 35% 可退 ITC)。
- CCA:电脑/外设 **Class 50(55%)**;手机/家具 **Class 8(20%)**;买断软件 Class 12(100%);AII 2024–2027 免半年规则;2025 联邦预算"生产力超级扣除"对 Class 50 首年 100%(2025-11-04 后购入)以会计师确认为准;可定 <$500 直接费用化政策。
- 不能扣:所得税、罚款、个人开支、分红、股东借款还款、不合理高薪(s.67)。

### 8. 创始人薪酬 / SR&ED / RRSP / PHSP 结论(真实项目 2026-09 口径)
- **三道门槛**先过再谈发薪:① 开放式工签(封闭工签为自己公司工作 = 未授权工作);② PR 路径(CEC/FSW 不承认自控公司经验);③ CCPC(税务居民)。
- 机制:雇佣协议 + **RP 程序账户**(直雇/发薪时才开,别提前开——开了每月报零)+ 代扣 CPP/所得税;持 >40% 表决权股 **EI 豁免**;工资算 SR&ED、分红不算;specified employee(>10% 股)只认基本工资、proxy 基数按 75%、上限 5×YMPE。
- SR&ED:代理法 = 直接研发工资 × 155%;联邦 35% 可退(CCPC;2026 Bill C-15 上限 $6M)+ 安省 OITC 8% 可退 + ORDTC 3.5% 不可退;财年后 T2+T661(最晚 18 个月);**记录制度从第一天起**(模板见 `07-政府项目/SRED-记录模板`,三问:技术不确定性/系统性调查/技术进步;失败也合格;纯 UI/CRUD/接 API/QA/PM/市场不算)。
- **结论**:创始人另有一份高收入全职工作时,边际税率 43–48% ≈ SR&ED 退款率 45–57% → **当年不发薪**,继续股东借款注资,免税抽回;等收入变低的年份再领薪;配偶真实参与研发(≥20h/周免 TOSI)才是正收益路径;检查主雇主合同的兼职与 IP 条款。
- **RRSP**:公司替创始人缴 = 应税雇佣收入(T4),个人一进一出为 0,公司只省 12.2% 且还多付雇主 CPP;额度应优先对冲 43–46% 的工资收入 → **不经公司**。2026 上限 $33,810;缴款截止次年 3 月初(首 60 天)。
- **PHSP/HSA**:公司全额扣、员工不计税;**前提是以雇员身份受益**(只当董事不领薪的一人公司易被定性为股东福利 s.15(1));额度 $1,500–5,000/年,第三方管理费 8–10%;**公司有利润后再上**。
- 硬件转公司:FMV Bill of Sale + 董事决议(s.132);个人非登记人不开 HST;公司按 CCA;转让款可记股东借款。

## 观测到的时长与费用
| 项 | 时长 |
|---|---|
| MyBA 关联 | 3 分钟(BN 到手次日) |
| 在线 RT 被拦 → 电话成功 | 08-26 被拦 → 08-31/09-01 满线 ×2 → **09-02 成功**(10 分钟通话) |
| MyBA 核实生效日 + direct deposit | 当天 |
| 书面确认信 | 注册后 6 天 |
| 注册审核来电 → 回电完成 | 注册后 7 天留言,次日回电 |
| 首期申报 | 期末后 1 个月截止;ITC 估 $355–625(实际清单 $447 + 后续周发票) |
费用:$0。

## ✋ 用户本人必须做
- CRA 登录(密码/2FA);打电话注册(报 SIN 等);MyBA 设 direct deposit;回审核电话;按期在 MyBA 提交 GST34。

## 验证 / 证据
- 台账记 RT 账户、生效日、周期、首期区间与截止;MyBA "Expected returns" 截图;确认信全文转录归档(`04-税务/CRA-GST注册确认通知-<date>.md`)。
- 凭证目录 `04-税务/凭证/<年>-Q<n>/` 每张 PDF 一份 + README 列本期应有票据。
- 首期 ITC 清单文件:逐项 日期/供应商/含税/HST/凭证档次与要点 + "看着像开销但抵不了"表。

## 坑与检查项
- ☐ 在线 BRO 被 "non residence" 拦 → 别改答案硬闯,直接电话。
- ☐ IVR 甩客当成操作错反复试 → 换窗口拨。
- ☐ 把 SIN/生日/邮编写进电话指引文件 → 抹除,改"口头作答"。
- ☐ 生效日填注册当天而非成立日 → 早期 HST 抵不了;回溯 ≤30 天要在窗口内办。
- ☐ Annual 申报 → 有 EOR 大额进项时改 Quarterly(现金流)。
- ☐ 回拨留言里的来电显示号码 → 只打 canada.ca 上的号。
- ☐ 以为"file"是提交文件 → 是申报。
- ☐ Apple/Google 开发者费、美国 SaaS 的税、保险 RST、银行费当 ITC → 不可抵。
- ☐ 公司 RT 号填进**个人**开发者账户税务档案 → 只能配置在以公司为主体的组织账户上;迁移前个人收入按原状。
- ☐ 早年个人开发者时期可能有个体户 GST 账户 → MyBA 企业列表自查第二个 BN;有则关户+补报进会计师议题。
- ☐ 提前开 RP 账户 → 每月报零;直雇/发薪时再开。
- ☐ 注册审核、T2 GIFI、发票、保险四处业务描述不一致 → 触发风险画像。

## 来源
- 档案:`04-税务/01`–`06`、`CRA-GST注册确认通知-20260908.md`、`凭证/2026-Q3/README.md`;`00-项目总控.md` 阶段 4;`07-政府项目/政府优惠政策报告.md`、`SRED-记录模板.md`。
- 官方:My Business Account https://www.canada.ca/en/revenue-agency/services/e-services/digital-services-businesses/business-account.html ;CRA 商业咨询 1-800-959-5525;注册审核回电 1-866-221-4063(canada.ca 联系页);RC4022 General Information for GST/HST Registrants;ETA s.169(4)、s.175、s.218;Input Tax Credit Information (GST/HST) Regulations SOR/91-45 s.3;Systematix Technology Consultants v. Canada, 2007 FCA 226;CRA "Confirm a GST/HST account number";"Confirming a simplified GST/HST account number"(Notice 322)。以上为档案引用,链接以 canada.ca 现行页面为准。
