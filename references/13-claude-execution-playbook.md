# 13 · Claude 执行手册:能代办什么、怎么代办、哪些必须用户本人

## 目标
让下一个会话用同样的方式干活:浏览器代填到"用户须亲自点"处停下、邮件从公司别名发、PDF 一条命令生成、电话给用户一张照读卡、每次交接都是「已代填 / ✋你要做」两栏。

## 1. 安全边界(硬规则,写进总控顶部)
用户本人必须做的三类 + 补充:
1. **政府/平台账号**:注册账号、输密码登录、2FA/验证码(GCKey、My Ontario Account、CRA、Apple ID、Stripe/Helcim 设密)。
2. **付款**:输卡号、刷卡、e-Transfer 发送、接受收费协议。
3. **最终提交**:每份官方表单的 Submit / Agree / certify 勾选由用户点;商户协议、Services Agreement、Program License Agreement 由用户接受。
4. **身份与证件**:DOB、家庭住址、SIN、证件上传——表单里用户的个人信息 Claude **可代填但每次先在对话里征得明确同意**;SIN/生日/邮编等**不写进任何文件**(口头作答提示)。
5. **电话**:用户打,Claude 给话术卡;来电核验用户接。
6. **法律/税务/移民/保险声明**:Claude 起草、标注"非持牌意见",最终由用户或专业人士确认;不替用户作商业决定,不质疑其决定,只提示约束。
其余(表单公司信息、配置、起草、归档、计算、调研)Claude 直接做。

## 2. 浏览器自动化(claude-in-chrome)模式
- **先 `tabs_context`**,找用户已登录的标签页;在用户会话内操作,不自己登录。
- **表单**:文本字段用 `form_input`;**checkbox / radio 用真实点击**——`form_input` 对 checkbox 不可靠,点击后**截图或 JS 读 `.checked` 核实**;自动滚动 SPA 里布局位移会让点击落空 → "fresh-screenshot-then-immediate-click":截图后立即点,再截图确认。
- **ref 失效**:页面重渲染后旧 ref 无效 → 重新 find/read 再操作;不要凭旧坐标连点。
- **慢页面**:screenshot + wait 循环,不要盲点;政府站(OBR、CRA)、Stripe 激活、Apple enroll 都慢。
- **Save vs Next**:多步向导里 "Save" 常跳回列表页丢上下文,**用 "Next / Continue / Save and Continue"** 按序前进;到 Review 页停下交用户。
- **隐藏 input / 自定义控件**:用 `form_input` 设值后看渲染是否变;Shadow DOM(BMO)用 JS 原生 setter + `dispatchEvent(new Event('input'))`;动态 name 的题按 id 抓。
- **停在哪**:遇到 DOB/住址/SIN/证件/银行账号/密码/2FA/付款/Submit → 截图、写清"页面停在 X,你接手点 Y",不尝试绕过。
- **不留测试痕迹**:探测第三方表单字段时不要真提交假邮箱线索(真实项目误发过一条 probe,正式提交里注明忽略)。
- **门户特性速查**:
  | 门户 | 特性 |
  |---|---|
  | OBR / Ontario Business account | Company Key 关联实体;Common Filings 菜单;提交即生效 |
  | CRA MyBA | 会话易过期(用户重登后接手);"Expected returns" 页截图存证;Submit documents 上传 |
  | BMO Business Xpress | Shadow DOM;芯片题动态 name;风控转介属正常 |
  | Stripe Dashboard | 激活向导多页;Review and submit 页停;Adaptive Pricing 在 Payment Links 不可关 |
  | Helcim | 注册 5 步;后台 settings 子域;绑行弹窗两路 |
  | Apple developer.apple.com | enroll 表单实时校验 D-U-N-S;file-upload 一次性;ASC 税表每份末尾 certify 勾 + Submit;银行表单 transit 自动解析验证 |
  | Zensurance | 报价页 qid 链接;改档在报价页切;结账页付款计划在下方 |
  | LinkedIn | Specialties 网页 bug;banner 2x JPG |
  | Namecheap | Advanced DNS;会话过期需用户重登 |
  | 一网通办(上海) | 中级实名认证阻点,本人做 |

## 3. Gmail MCP 的坑
1. `create_draft` / `update_draft` 会把正文任何网址或裸域名(**含 htmlBody 显式 `<a href>`**)改写成 `https://www.google.com/url?q=…` 跳转 → 发给 Apple/CRA 这类核验对象显得可疑。**对策**:正文尽量不放网址("见我原始请求中的网站");必须放时,告诉用户发送前在 Gmail 里删掉重敲一次;或由 Claude 在 Chrome 的 Gmail 网页里直接写发。
2. `update_draft` 会让**回复草稿脱离原线程**(threadId 变自身)并丢引用 → 改稿一律 **trash 旧草稿 + `create_draft` + `replyToMessageId` 重建**,用 `get_draft` 核对 threadId 与 href。
3. 搜索验证码/通知邮件:按发件域名 + 时间窗搜(`from:noreply@… newer_than:1h`),读一次即用;Adobe Sign、Humi、Apple、Stripe 的邮件可能进垃圾箱。
4. 发件人别名:Gmail 网页写信时切换 From 为公司别名并 JS 验证 From 已切换后再发;发出后回读"已发送"确认。
5. 附件下载(PDF)需用户授权;能看预览就口述关键字段让用户确认。

## 4. PDF / HTML 生成工具链
- **HTML → PDF**:`scripts/html2pdf.sh <in.html> <out.pdf>`(Chrome headless `--headless=new --print-to-pdf --no-pdf-header-footer`);在 HTML 里用 `@page { size: letter; margin: 20mm }`、`.doc { page-break-after: always }`、`.sig-block { page-break-inside: avoid }`、`.screen-note { @media print { display:none } }`;**同时出 clean 版**(去掉所有说明行)供对方签。
- **SVG → PNG**:`rsvg-convert -w 1024 -h 1024 icon.svg -o icon-1024.png`(App icon / LinkedIn logo);banner 用 2x JPG。
- **合并 PDF**:`qpdf --empty --pages a.pdf b.pdf -- merged.pdf`(Apple 补件的 Certificate + Articles 合并;≤5MB)。
- **PDF 取文本**:`pdftotext` 若无,`python3 -c 'import pypdf…'`(需 `pip install --target /tmp/pydeps pypdf` 后 `PYTHONPATH=/tmp/pydeps`);**没有 pdftoppm 时**用 Chrome headless 截图或 `qpdf --split-pages` 后交用户预览;识别原件版本用 `shasum -a 256`。
- **HTML 快照存证**:`curl -s -o snapshot-<date>.html -w '%{http_code}' https://…`(招聘证据的 careers 页快照,记 HTTP 200)。
- **信头**:`templates/letters/letterhead.html` 占位符替换后打印。

## 5. 电话话术格式(给用户照读)
```
# <事项> 回电/接电话话术(<日期>)
> 拨/接:<号码> → 分机 → 参考号;先验真:<官方页面/工具>
## 0 开场 / 转接 / 留言(英文一句 + 中文提示)
## 1 身份核实(表:问题 | 英文回答)        ← 个人敏感项写"(如实口头答)"
## 2 业务性质  ## 3 为什么/预期数字  ## 4 开支与首期  ## 5 雇员  ## 6 银行
## 7 敏感点与岔路(对方说 X → 你顶回 Y)
## 8 收尾三问(下一步/谁行动/多久;新参考号;要不要文件)
## 9 不该出现的事(要求付款/礼品卡/密码/威胁 → 挂断打官方号)
```
所有答案与已提交材料、确认信一致;数字速查卡放最上面。

## 6. 调研与引用规范
- 每个数字(费用、天数、费率、门槛)写**具体值 + 日期口径 + 来源链接**;区分「官方规则 / 平台营销描述 / 内部记录 / 推测」四类,推测标"推测"。
- 网上核不到的档案事实标「档案记录,未二次核实」;不为"完整"编造门户步骤,写「档案未记录,执行时先截图确认」。
- 报告结构:结论先行 → 分类表(✅ 现在可申 / ⏳ 条件达成后 / ❌ 不符合并注明原因)→ 行动日历 → 免责一句("研究整理,不构成税务/法律意见")。
- 供应商真伪:政府登记库(Canada's Business Registries、OBR、THA 登记库、CRA GST 登记库)核法定名、BN、状态;案例(判例)查真实存在再引用,并注明"读法有争议"。

## 7. 交接清单格式(每阶段 / 每次会话结束)
```
## 已代填 / 已完成
- <系统> <页面>:<字段们> 已填;停在 <位置>
## ✋ 你要做(按顺序)
1. <动作>(<在哪>,<需要什么>,<预计几分钟>)
2. …
## 等对方
- <谁> <什么> <触发催办的时点>
## 已归档
- <路径>(commit <hash>)
```
总控待办表同步更新:# / 事项 / 状态-下一步 / 截止;✋ 标记需用户亲手。

## 8. 后台等待与并行
- 等审核/邮件回复时**不要 foreground sleep**;用 `run_in_background` 起轮询(如每 5–10 分钟查一次邮件/页面状态),主线继续做别的阶段。
- 可并行的阶段并行:官网+邮箱 ∥ Minute Book 起草 ∥ D-U-N-S 申请;Helcim 复议 ∥ Stripe 开户;保险三家 ∥ EOR 谈判。
- 每完成一件实质变更即 commit + push(14)。

## 9. 沟通语言与措辞
- 中文与用户沟通;对外文件英文;官方名词/门户/字段保留英文原文。
- "我不是持牌律师/会计师;涉及复杂税务或跨境架构,最终文件请专业人士过目"这句放总控末尾。
- 状态词只写有证据的:研究、草稿、打开表单、用户选名 ≠ 受理、核准、签署生效、开户完成。

## 来源
- 档案:`00-项目总控.md`(安全边界三类);memory `gmail-draft-url-wrapping.md`、`canada-company-registration.md`(BMO 表单技巧);`03-公司治理/*打印包*.html`;`08-Apple迁移/01-Apple来电核验话术.md`;`04-税务/06-CRA注册审核回电英文脚本.md`;`07-政府项目/EOR询价邮件稿.md`(HubSpot API 提交、probe 教训);`11-上海浦东子公司/00-筹办总控.md`(状态口径);会话转录定点抽取(checkbox 点击落空与 fresh-screenshot 技巧)。
- 编排者提供的经验条目(claude-in-chrome:tabs_context / form_input 对 checkbox 不可靠 / ref 失效 / 慢页面 / Save 跳走 / 隐藏 input)——已按其原文纳入。
