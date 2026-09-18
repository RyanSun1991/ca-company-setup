# 06 · 品牌交付包、官网(GitHub Pages)、DNS/HTTPS、企业邮箱别名与发件、LinkedIn 公司页

## 目标
注册次日官网 HTTPS 上线、12 个部门邮箱别名可收、3 个别名可发、LinkedIn 公司页开张——因为 Apple(组织注册)、CRA(注册审核)、银行、EOR、保险都会核官网与公司域名邮箱。

## 前置条件
- 域名已注册(01);品牌方向与色板已定;GitHub 账号;Gmail 账号(接收转发)。

## 步骤

### 1. logo 交付包(`05-品牌/logo-交付包/`)
| 文件 | 用途 |
|---|---|
| 字标 SVG ×2(深底用 ice / 浅底用 ink) | 印刷/网页任意缩放 |
| 图标 SVG ×2 | 头像/favicon/水印;16px 场景只用图标 |
| App icon SVG + 1024×1024 PNG(方形无透明,圆角平台自动加) | App Store / Play |
| 字标 PNG ×2、lockup(字标+副标)PNG ×2(2400px 深浅底) | PPT/文档/对外首选 |
| letterhead.html | 公司信头(浏览器打开 → 打印 → PDF;见 templates/letters) |
| LinkedIn logo 300px PNG;**banner 需 2x JPG(2256×382)** 才能过 LinkedIn 上传管线 | |
| README-使用指南 | 留白 ≥ 字高 1/2;禁渐变/阴影/描边/拉伸/叠图 |
色板写进公司信息表(官网、收款页品牌、收据邮件统一用)。

### 2. 官网(GitHub Pages,免费)
- 页面最小集:index / privacy / terms / 404 / robots.txt / sitemap.xml;后续 careers、contact、products;SEO/OG、Schema.org Organization、favicon。**隐私政策与条款的主体、controller 地址用公司注册地址**——App 上架与 Apple 迁移直接引用。
- 仓库:`github.com/<user>/<domain>`,**PUBLIC**(免费版私仓不能建 Pages;源码即公开页面,无泄密面)。想私有 → GitHub Pro 或迁 Cloudflare Pages,动之前与用户确认。
- Pages:main / root,CNAME 文件 = 裸域;`<user>.github.io` 入口 301 到自定义域。
- **DNS(Namecheap Advanced DNS)**:删停靠 `A/ALIAS/URL Redirect @`(**别动 MX/TXT——邮箱转发**);加 4×A `@` → GitHub Pages IP(185.199.108.153 / 109 / 110 / 111)+ `CNAME www` → `<user>.github.io.`;生效 5–30 分钟。
- HTTPS:证书签出后 `gh api repos/<user>/<repo>/pages -X PUT -F https_enforced=true`;www 301 归一。
- **ICANN 注册人验证**:注册商邮件里的链接必须点(否则域名被暂停);电脑端邮件链接损坏是客户端渲染问题,手机点即成功;面板 ALERT 24–48h 消失。
- 官网独立仓库**不**进公司档案仓库(`.gitignore` 排除 `06-网站/site/`),push 即发布。

### 3. 企业邮箱(Namecheap 免费转发 → Gmail)
- 别名(12 个部门 + 个人):hello / info / contact / support / partnerships / press / careers / security / legal / privacy / billing / <founder>@{{DOMAIN}};员工入职加 `<first.last>@`(转发到本人邮箱)。MX 生效后官网各页用对应地址。
- **发件(send-as)**:Gmail → 账户 → 以其他地址发送 → 需注册商 SMTP + **Gmail 应用专用密码**(✋ 用户配);显示名统一 "<Company> Technologies"。至少配 hello@ / partnerships@ / support@ / billing@。
- **对外发件地址约定**:供应商询价与合同 = `partnerships@`;账务与收款平台登录 = `billing@`;用户支持 = `support@`;政府/公开 = `hello@`;Apple Developer 通信从 **Apple ID 邮箱**同线程回复(case 关联);个人别名只用于需要"本人"身份的场合。
- 升级路径:Namecheap Private Email 或 Google Workspace(独立收件箱、DKIM/DMARC);Supabase 等认证邮件走个人 Gmail SMTP 是结构性遗留,尽早换域名 SMTP。

### 4. LinkedIn 公司页
- 建页:名称、口号、logo、banner(2x JPG)、行业 Software Development、规模 2–10、Privately Held、成立年、About(~1000 字符)、**Locations = 注册地址(Headquarters)**;管理员 = 用户个人号(对外不可见)。
- 首两帖:公司亮相(lockup 图)+ 招聘帖(careers 链接卡);之后双周 1 帖,周二/四上午;5 大支柱(招聘与团队 / 工程与 AI 观点 / 产品 / 里程碑官宣 / 隐私与责任)。
- **Specialties 网页版控件 bug(chip 保存即丢)→ 手机 App 里加**。
- 纪律:数字类宣称不发;团队成员未同意不露脸露名;不蹭政治热点;不贬竞品;每帖存档到运营手册;不买 Premium/Boost。
- 招聘证据:careers 页上线的 commit 哈希 + LinkedIn 帖子日期 = 日后 EOR 要求的"职位发布证据"锚点(见 08)。

## 观测到的时长与费用
| 项 | 值 |
|---|---|
| logo 交付包 | 1 天,$0 |
| 官网设计+上线 | 1 天;DNS 生效 5–30 分钟;**HTTPS 首次签发卡 3h → 移除再加自定义域后 4 分钟签出** |
| 邮箱 12 别名 | 30 分钟,$0(注册商免费转发) |
| LinkedIn 页 | 1 小时,$0 |

## ✋ 用户本人必须做
- 注册商登录(密码)与 DNS 修改(或登录后让 Claude 接手);ICANN 验证邮件点击;Gmail 应用专用密码与 send-as 验证码;LinkedIn 建页确认与 Specialties(手机);官网仓库可见性变更的确认。

## 验证 / 证据
- `curl -I https://{{DOMAIN}}` 200 且 `www` 301;`gh api repos/<u>/<r>/pages` 显示 `status: built`、`https_enforced: true`、`cname`。
- 从每个 send-as 地址发一封测试信,From 下拉显示名正确。
- 总控"阶段 5/8/12"记上线日期、别名清单、LinkedIn URL。
- careers 页 commit 哈希写入招聘证据包。

## 坑与检查项
- ☐ **官网仓库被设 Private → Pages 停 → 官网 404 → Apple 撤回组织注册**(真实项目 9/14)。排查:`curl -I` 看 GitHub "Site not found";`gh repo view` 看 visibility;修复 `gh repo edit <u>/<r> --visibility public` + 重建 Pages(main/root + CNAME);等 apex 200 再重提。**在档案 CLAUDE.md 写死这条规则**。
- ☐ www 子域 404:GitHub 重建后重定向需时间;Apple/CRA 核的是 apex,不阻塞;确认 CNAME 记录仍在。
- ☐ HTTPS 卡 3 小时 → 移除自定义域再加回。
- ☐ 删 DNS 停靠记录时误删 MX/TXT → 邮箱断。
- ☐ 隐私政策里写了个人住址(旧个人页)→ 改跳转到公司站;controller 用公司地址。
- ☐ 隐私政策承诺与工程现实不一致(加密、删号 30 天、明示同意流程)→ 上线后做一次工程核验,核验前不加新的具体数字承诺。
- ☐ LinkedIn banner 用 1x PNG 上传失败 → 2x JPG。
- ☐ 用个人 Gmail 直接对外发供应商邮件 → 用别名 send-as。

## 来源
- 档案:`06-网站/README-上线步骤.md`;`05-品牌/logo-交付包/README-使用指南.md`;`09-LinkedIn运营/运营手册.md`;`08-Apple迁移/迁移前后清单.md`(Private 仓库事故);`00-项目总控.md` 阶段 5/8/12;`CLAUDE.md`(仓库公开规则)。
- 官方:GitHub Pages 自定义域与 IP https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site ;GitHub Pages 私有仓库需付费计划 https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages ;Gmail "Send emails from a different address" 帮助页;ICANN 注册人验证(注册商邮件)。
