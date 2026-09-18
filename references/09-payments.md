# 09 · 收款通道:Stripe + Helcim 双通道开户、审核/复议、逐项配置、费率与到账、中国付款人方案、测试付款记账、OTT Pay 备选

## 目标
B2B 发票能收卡 / PAD(银行扣款)/ e-Transfer,中国客户能付支付宝,两家月费 $0 并行;发票带 GST/HST 号、Net 15、公司品牌;资金入公司账户。

## 前置条件
- 公司账户 + void cheque / direct deposit form(05);官网 HTTPS + privacy/terms/contact 页(06);`billing@{{DOMAIN}}` 别名(登录名与收据)、`support@`;BN 与 RT 账户(04);公司电话可收 SMS。
- 先答"卖什么":App 内购走 Apple/Google 结算与本节无关;B2B 服务/咨询 → Helcim 主 + Stripe 备;面向华人零售 → OTT Pay 等只在有真实用例时申请。

## 步骤

### 1. 代办边界(两家一致)
注册设密码、录证件/DOB/家庭住址/SIN、录银行账号或上传 void cheque、接受商户协议、点最终提交、手机验证码 = **用户本人**;公司信息、产品描述、税率、发票模板、品牌、通知、付款页 = Claude 代填/配置(用户登录后同一浏览器会话内)。

### 2. Helcim(Interchange+,主通道)
**注册 5 步 ~10 分钟**:①账户(姓名 / `billing@` / ✋密码;Canada;owner resides in Canada)②业务(Legal name / Operating (DBA) name / Year registered / Business address = 注册地址 / Structure Corporation / Phone / Website)③产品(Industry **Computer Software Design – 7372A**;描述 "Software development and technology consulting services for business clients … invoiced per project or monthly"——如实、不提 App 订阅;Delivery timeline 0–30 days)④估算(CAD;月流水 $0–10k;平均单笔 $1,000)⑤Tax ID = BN ⑥所有人(姓名 100%;✋DOB/住址/SIN)。onboarding 问卷:不接会计软件(秋季再定)、一次性 + 定期、**Online Fee Saver 开**(In-person 关)、了解 ACH/PAD。
**审核**:Trust & Safety 通常 1 工作日;真实项目**拒批**(无理由;推测:成立 13 天、无处理历史、临时居民 SIN)→ 从 `partnerships@` 发**复议邮件**(B2B 发票用途、低流水、可提供注册证书/BN/银行证明/签约合同/证件,接受限额或延长放款)→ **3 天后通过**。复议期间并行开 Stripe。
**绑行**(Home → Banking → Link bank account):Plaid(要 BMO 网银借记卡号+密码交第三方,公司账户可能连不上)或 **Upload document manually(推荐;纯上传 void cheque/直接存款表,2 工作日人工绑定)**。绑定前可开发票,资金不入账。
**后台配置**(settings.helcim.com):ACH/PAD 默认开(限额 $0–25,000);Invoicing 默认付款方式**补勾 ACH**;税区 Canada → **ON = HST 13% "Instead of country tax"**(按处理账户地址计);时区改 **Eastern**;发票:编号起始、默认账期 30 → **15 天**、逾期提醒 **Weekly**、**部分付款关**(B2B 一票一清);**无 GST 号专用字段 → Branding → Invoice → Footer → Content 写固定页脚**:"GST/HST Registration No. <BN> RT0001. Pay online by credit card or pre-authorized debit using the link in this invoice, or by Interac e-Transfer to billing@<domain> (please quote the invoice number)."(满足 CRA 凭证;e-Transfer 需 BMO Autodeposit 绑 billing@);Branding Invoice/Receipt/Customer Portal 上 logo + 主题色;Communications 开 Transaction approved(客户收据 + 商户副本)/ refunded / Batch settlement / Invoice paid / Pay now;**Payment Page**(Invoice Payment 类型:Invoice ID 必填、金额必填、Comments、Business Name、Contact Name/Email 必填、Customer ID 隐藏;页脚含 GST 号与 billing@)→ 公开链接放官网/邮件签名;Helcim Defender 留用户一键(需接受单独条款)。
**禁忌**:不要用本人/关联人卡在 Helcim 刷测试款(商户协议禁止,刚过复议更别碰)。

### 3. Stripe(固定费率,备用 + 支付宝)
dashboard.stripe.com/register(`billing@`;✋密码)→ 欢迎向导(业务名、官网、描述;**选 "Pick what you need"** 避开 3.5% Managed Payments;勾 Payments/Subscriptions/Invoices/Tax)→ **Activate Payments**:Business type Canada / Company / Corporation;Business details:法定名、DBA、**注册号填 OCN**(通过)、**地址 = 注册地址(用户曾误填家庭住址)**、电话、官网;Products = Software + 描述(MCC 7372);Public details = 公司电话显示于收据;Statement descriptor "<COMPANY> TECHNOLOGIES" / 短 "<COMPANY>";Account representative(姓名/邮箱/President & CEO;✋DOB/住址/SIN/电话);Business owners/directors(100%);✋Add bank(BMO);✋2FA;可选 Radar Lite(含)、**Stripe Tax 不开**(0.5%/笔,用手动税率免费)、Climate 不开;✋ "Agree and submit" = 接受 Services Agreement。审核数小时–3 天(真实 3 天),通过后 Payouts 解锁。
**配置(审核期可先做)**:手动税率 **HST 13%, Canada–Ontario, exclusive**,描述含 GST 号;**Canadian pre-authorized debits(PAD)启用**(周处理上限初始 $15k 可申请提高;延迟到账建 webhook);**Alipay、WeChat Pay 申请**(Alipay 通过;**WeChat 判 Ineligible**,非待审);发票默认 memo(付款方式含 e-Transfer 到 billing@)、footer(公司名/地址/GST 号/联系)、**Net 15**、默认付款方式 Cards + PAD;**Invoice tax information → CA GST/HST `<BN>RT0001`**(印在 PDF);Branding logo/icon/品牌色;Customer emails 开 Successful payments + Refunds;Public details 补支持邮箱 `billing@`、支持/隐私/条款 URL;发票编号 **账户级连续 + 前缀**(如 `<ABBR>-0001`);**Adaptive Pricing 只能在 Checkout / Elements / Hosted Invoice Page 关,Payment Links 强制 Always on**(客户可自选 CAD;对中国客户优先发 Invoice 而非 Payment Link);**Klarna Disable**(5.9%+30¢ 分期对 B2B 无意义);Payouts = Automatic / Daily / Accelerated(T+3 工作日);**手机 SMS 验证**(只影响虚拟终端手动录卡,✋)。

### 4. 费率与到账(2026-09 官网核对;CAD;月流水 ≤$50k)
| 方式 | Helcim | Stripe |
|---|---|---|
| 加拿大消费卡(线上/发票) | IC 1.40–2.03% + 0.10% + **0.50% + 25¢** ≈ 2.0–2.6% | **2.9% + $0.30** |
| 商务卡 / Amex | ≈2.6–3.0% / ≈2.7% | 同上 |
| 国际卡(如中国发行 MC) | IC 1.10% + 0.10% + 跨境 0.678% + 0.50% + 25¢ ≈ **2.4–3.3%** | +0.8% → **3.7% + $0.30** |
| 非 CAD 计价 | — | 再 +2% |
| 当面 Tap to Pay(零硬件) | IC + 0.40% + 8¢ | 2.7% + 5¢(Terminal 需硬件) |
| Interac 借记(需终端 $429 / 读卡器 $239) | 9¢ 插 / 12¢ 拍 | 15¢ |
| **银行扣款 ACH/PAD** | **0.5% + 25¢,封顶 $6**;>$25k 部分 +0.05%;退票 $5 | **1% + $0.40,封顶 $5**;失败/争议 $5;即时验证 $1 |
| 支付宝 | 不支持 | 2.9% + $0.30(CAD 计价;无拒付;90 天可退) |
| 微信 | 不支持 | Ineligible |
| Fee Saver / 便利费 | 客户承担 ≤2.4%(法定上限;页面显示 3.0% 视卡种),我方 0%;须开 ACH 作免费替代 | 需手动加行项 |
| 发票功能 | 免费 | 已付发票 0.4%,封顶 $2(Payment Link 免) |
| 订阅 | Recurring 免费 | Billing 0.7% |
| 争议 | 败诉 $15 | $15(+应诉 $15) |
| 退款 | 不收费 | 不收费但**原手续费不退** |
| 到账 | 卡 **次一工作日上午**;ACH 3–4 工作日(批次 14:45 MST) | **首笔 7 个自然日,之后 T+3 工作日**;PAD ≈ 8 工作日;即时 1%(新账户不可) |
| 月费/PCI/开户 | $0 | $0 |
**$1,000 到手**:Helcim 卡 ≈ $974–980(Fee Saver 开则 $1,000)、PAD $994.75;Stripe 卡 $968.70(含发票费)、PAD $993、Alipay $968.70;e-Transfer(BMO)$1,000。

### 5. 分流规则
| 场景 | 通道 |
|---|---|
| 加拿大 B2B 发票(默认) | **Helcim**:发票链接卡(Fee Saver 转嫁)或 ACH/PAD |
| 加拿大大额 ≥$5k | **e-Transfer 到 billing@**(Autodeposit,上限 $25k)或 PAD |
| 中国客户(外币 MC / 支付宝) | **Stripe**:Invoice 列 Alipay + 卡,**CAD 计价**;小额首选支付宝(无拒付);客户有免换汇全币种 MC 时 Helcim 国际卡更省 0.5 点;≥$5k 走国际电汇(BMO 入账 ≈$15–17;付款人汇出 ¥150–300 + 换汇 0.5–1%);Wise **不支持中国大陆发起** |
| 微信 | 等 OTT Pay(目标 ≤1.8%) |
| 订阅/自动扣款 | Helcim Recurring(免费)或 Stripe Billing |
| Helcim 故障/限额 | Stripe 备用 |

### 6. 测试付款与记账
- Stripe $1 卡测试 + $100 支付宝实测(手续费 $3.20 = 2.9%+$0.30,无换汇附加 = CAD 计价生效)→ 首笔打款 $97.46(7 天后)。
- **记账口径**:两笔均为股东本人付款 → **不是销售**;净额记股东往来(借款),手续费记支付处理费用;首期 GST 销售额仍为 0。建议 90 天内退款(手续费不退)以免账上出现非真实销售。

### 7. OTT Pay(支付宝/微信/银联,仅有真实华人客群时)
无公开申请表与费率;流程 Contact/Consult → 评估 → MCC 主营业务核验 → 渠道注册(微信更严)→ 签约 → 上线,3–10 工作日;材料:注册证书与章程、BN、✋法人证件、✋void cheque、经营场所/网站证据(软件公司 = 官网 + LinkedIn)、类目描述(避开代购/保健品/金融/烟酒)。谈判五项:费率 ≤1.8%、新商户 3–6 个月减免、月费 $0 或封顶 $10、T+1 CAD 结算、无锁定期。真实项目 9/4 提交咨询表(承诺 3–5 工作日),两周无回 → 催办。

## 观测到的时长与费用
| 项 | 值 |
|---|---|
| Helcim 注册 → 拒批 → 复议通过 | 09-04 → 09-05 → 09-08 |
| Stripe 注册 → 激活提交 → 审核通过 | 09-05 当天 → 09-08 |
| 两家银行绑定完成 | 09-08 |
| Stripe 首笔打款 | 09-14(首笔 7 天规则) |
| 月费 | 两家 $0 |

## ✋ 用户本人必须做
- 两家注册设密、身份页(DOB/住址/SIN)、绑行(上传 void cheque / Add bank)、接受协议 / Agree and submit、SMS 验证、Helcim Defender 条款;BMO Autodeposit 绑 billing@;测试付款与退款决定。

## 验证 / 证据
- 台账账号行:平台、用途、登录邮箱、2FA 方式、开户/审核/绑行日期、费率档、公开付款页链接(不写账号 ID 到公开副本)。
- 准备包文件:逐字段答案、进展日志、费用表、分流规则、数据来源与核对日期。
- 首笔打款到账银行流水与记账口径备注。

## 坑与检查项
- ☐ Helcim 拒批当终局 → 复议信 + 并行 Stripe。
- ☐ Stripe 地址填家庭住址 → 改注册地址。
- ☐ 选 Managed Payments(3.5%)→ "Pick what you need"。
- ☐ 开 Stripe Tax(0.5%)→ 手动 HST 税率免费。
- ☐ Payment Link 给中国客户 → Adaptive Pricing 强制;改 Invoice。
- ☐ Klarna 默认开 → 关。
- ☐ Helcim Invoicing 默认只勾卡 → 补 ACH,否则 Fee Saver 无免费替代不合规。
- ☐ Helcim 时区默认 Atlantic → Eastern。
- ☐ Helcim 找 GST 号字段 → 用发票页脚。
- ☐ Plaid 连公司账户 → 上传文件。
- ☐ 本人卡刷测试 → Helcim 禁止;Stripe 测过一次够了,且记股东往来。
- ☐ 以为 WeChat 待审 → Ineligible,另找通道。
- ☐ 以 CNY/USD 计价 → +2%;一律 CAD。

## 来源
- 档案:`10-支付/01-收款通道申请准备包.md`(§0–§10 全部)、`10-支付/02-软件与AI订阅台账及税务处理.md`;`00-项目总控.md` 待办 #5;`01-决策与名称/账号与订单台账.md`。
- 官方(2026-09-08 核对):helcim.com/pricing、/free-credit-card-processing、/international-credit-card-processing、/mastercard-canada-interchange-rates、/visa-canada-interchange-rates、/american-express-canada-opt-blue-rates、learn.helcim.com(ACH 结算);stripe.com/en-ca/pricing、/pricing/local-payment-methods、docs.stripe.com/payouts、docs.stripe.com/payments/alipay;ottpay.com/contact-us。
