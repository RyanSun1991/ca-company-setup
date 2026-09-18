# 02 · 安省公司注册(Ontario Business Registry)、Certificate、Initial Return、公司信息表

## 目标
在 OBR 在线提交 Articles of Incorporation,当天拿到 Certificate of Incorporation + Articles 官方 PDF 与 Ontario Corporation Number(OCN);60 天内完成 Initial Return;建立"公司信息表"作为后续所有表单的主数据。

## 前置条件
- 01 阶段产出:NUANS 报告(名称逐字一致含后缀、编号、日期)、注册办公地址(含 Unit)、董事姓名与送达地址、财年、股权结构决定。
- ✋ 用户已注册 **My Ontario Account(Ontario.ca Login)**(账号邮箱 = 日后 OBR 登录名;官方邮箱可另设)。

## 步骤

### 1. OBR 在线 Articles of Incorporation(Business Corporation)
逐字段(与官方 Articles 的 1–10 条对应):
| 字段 | 填什么 | 备注 |
|---|---|---|
| 1 Corporate Name | 与 NUANS 报告逐字一致(含 `INC.`) | 同时填 NUANS 报告编号与日期(Articles 第 3 页 "Nuans report information") |
| 2 Registered Office | 完整地址含 Unit、邮编 | 虚拟商业地址 |
| 3 Number of Directors | Min 1 · Max 10 | 弹性区间,日后加人不改章程 |
| 4 First Director(s) | 姓名;**Resident Canadian: Yes/No**;送达地址 = 注册地址 | 工签持有人填 **No** 是正确且必要的(OBCA 定义 = 公民/PR;与税务居民无关;安省无居民比例要求,填 No 无不利后果,填 Yes 反而是虚假陈述) |
| 5 Restrictions on Business | None | |
| 6 Classes of Shares | **政府预定义私人公司条款**:仅 "unlimited number of Common Shares" | 想要优先股/多类别必须走自定义条款,否则日后需 Articles of Amendment |
| 7 Rights/Privileges | 单一类别 → Not applicable | |
| 8 Share Transfer Restrictions | 预定义:转让须董事多数决议 **或** 股东多数决议批准 | 维持"私人发行人"豁免 |
| 9 Other Provisions | 预定义:证券(除不可转换债务证券)转让须董事或股东多数许可 | |
| 10 Incorporator | 创始人姓名 + 送达地址 | |
| 提交附带 | Official Email(可先填登录邮箱,Initial Return 时改公司域名邮箱);公司电话;NAICS(按选单核对) | |
- ✋ 用户付 **$300** 注册费、点 Submit。**即时生效**(真实项目 19:02 提交即成立)。
- 邮件三封:Payment Receipt(交易号)、"Articles of Incorporation"(含 **Certificate + Articles PDF 下载链接,长期有效**)、**Company Key**(以后所有 OBR 申报都用;保密,不写入任何文件)。

### 2. 归档与主数据
- 下载 `Certificate_of_Incorporation.pdf`(1 页)+ `Articles_of_Incorporation_EN.pdf`(3 页,含 NUANS 信息页)→ `02-注册文件/`。这两份互为配套,任何对外提交都 1+3 页一起给。
- 建 `02-注册文件/公司信息表.md`(模板见 `templates/`),内容项:法定名/管辖/品牌名/主营+NAICS/财年/注册地址/官方邮箱/公司电话/My Ontario Account 状态;董事股东高管;股份结构(**以官方 Articles PDF 为准**,不是草案);转让限制;域名与品牌;费用清单;税务标识(BN/RC/RT/RP 留空待填);D-U-N-S;银行账户(待填)。
- 注册前的 Articles 草案标注「历史存档,未按此注册」,永不再编辑。

### 3. BN(Business Number)
- 安省注册自动触发 CRA 创建 9 位 BN + 公司税账户(RC 程序账户);**1–2 个工作日**回传。OBR 页面此前显示 `[Unavailable]`;真实项目在**安省企业面板**(Business Ontario / BXP)第 3 天看到。等不及可打 CRA 商业专线 1-800-959-5525。
- 到手后填公司信息表、台账;进入 04 阶段。

### 4. Initial Return(注册后 60 天内,免费)
- 路径:Ontario Business account → 公司 profile → **Common Filings → File Initial Return**(新用户先在 "Find your business" 用 Company Key 关联实体)。
- 真实项目 Claude 代填 **6 步**(具体页面名档案未记录,执行时先截图确认),用户本人 Submit。内容:注册地址、邮寄地址、**官方邮箱改为公司域名邮箱**(如 `hello@{{DOMAIN}}`)、董事、**高管申报(President + CEO 两条;Secretary/Treasurer 暂缺由 President 代行)**、董事居民信息。
- 提交后总控里把"Initial Return 死线"划掉;安省企业面板(BXP)顺手补运营名与员工数。

### 5. 其他 OBR 可购文件(日后 KYC / 海外用)
| 文件 | 费用 | 用途 |
|---|---|---|
| Corporation Profile Report | $8(即时) | 银行/EOR/海外接收方要"最新档案" |
| Certificate of Status | $26 | 证明公司 Active |
| Document copy | $3/份 | 重取 Articles 纸件形式 |
| Annual Return | 免费 | 每年财年末后 6 个月内(与 T2 同期) |
| Notice of Change | 免费 | 董事/地址变更 15 日内 |

## 观测到的时长与费用
| 项 | 费用 | 时长 |
|---|---|---|
| OBR 注册 | $300 | 表单 30–60 分钟,提交即生效 |
| Certificate/Articles PDF | 含 | 当晚邮件 |
| BN 回传 | $0 | 2 天(08-23 注册 → 08-25 可见) |
| Initial Return | $0 | 次日 20 分钟(死线 60 天) |

## ✋ 用户本人必须做
- 注册/登录 My Ontario Account;付 $300;点 Submit;Initial Return 的 Submit。
- 保管 Company Key(密码管理器)。

## 验证 / 证据
- Certificate 上的 OCN、成立日期与 Articles 页眉一致;NUANS 编号与 01 阶段有效报告一致。
- 台账"关键凭据与编号"记 OCN、交易号、注册日期、Company Key 位置(只写"见 X 日邮件",不写值)。
- 后续 Minute Book 决议 §1 引用 OCN 与成立日。

## 坑与检查项
- ☐ NUANS 名称与 Articles 名称不一致(缺后缀)→ 拒收。提交前再对一次。
- ☐ 以为草案里的优先股条款已注册 → 实际用了预定义条款。**一切以官方 Articles PDF 为准**,拿到 PDF 当天逐条核对并更正信息表。
- ☐ Resident Canadian 填成 Yes → 虚假陈述;填 No 才对(工签)。日后拿 PR 提交 Notice of Change。
- ☐ 官方邮箱留个人 Gmail → Initial Return 时改公司域名邮箱,否则政府信件进个人邮箱、对外不一致。
- ☐ BN 没出现就急着开银行/CRA → 等 1–2 天看安省企业面板,不必打电话。
- ☐ Company Key 抄进文件 → 违反敏感纪律。

## 来源
- 档案:`00-项目总控.md` 阶段 2;`02-注册文件/公司信息表.md`;`02-注册文件/Articles-of-Incorporation-草案.md`(历史);`11-上海浦东子公司/15-加拿大注册文件中文翻译底稿.md`(官方 Articles 逐条内容);`11-上海浦东子公司/16-认证与原件交付执行清单.md`(OBR 报告费用)。
- 官方:https://www.ontario.ca/page/ontario-business-registry ;费用页 https://www.ontario.ca/page/cost-time-required-to-register-change-search-for-business-name-corporation-not-for-profit ;Initial Return 60 天要求来自 OBR 注册确认邮件(档案记录)。
