# 📖 zh1227 网站全能操作与维护手册 (极详尽版)

本手册是为您量身定制的“无脑式”操作指南。涵盖了从写文章、传图片到全站参数修改的每一个细节。请将其作为您的常备工具书。

---

## 🚀 第一部分：内容创作（文章与图片）

### 1. 文章存放在哪里？
所有的文章都必须放在 `content/posts/` 目录下。
- **推荐结构（Page Bundles）**：为每篇文章创建一个独立的文件夹。
  - 路径示例：`content/posts/我的第一篇文章/`
  - 文件夹内必须包含：`index.md`（正文文件）
  - 文件夹内可以包含：图片、附件等。

### 2. 如何发布一篇新文章（无脑步骤）
1.  **创建文件夹**：在 `content/posts/` 下新建一个文件夹（不要用中文名，建议用英文或拼音，如 `my-new-post`）。
2.  **创建文件**：在文件夹里新建一个文本文件，命名为 `index.md`。
3.  **填写头部信息（Front Matter）**：在文件最开头写入以下内容。这些参数定义了文章的“身份证”：
    ```markdown
    ---
    title: "这里写文章的中文标题"  # 必填：文章主标题
    date: 2024-01-02              # 必填：发布日期（用于排序）
    description: "这里写一段简短的文章摘要" # 推荐：给搜索引擎看的 SEO 描述
    summary: "这里写首页卡片显示的简介"   # 可选：如果没写，会自动截取正文
    tags: ["标签1", "标签2"]       # 可选：文章标签（会自动汇总到标签页）
    categories: ["分类1"]         # 可选：文章分类
    showTableOfContents: true     # 可选：是否显示右侧目录
    draft: false  # ⚠️ 必须是 false 才能发布！如果是 true，文章仅本地可见。
    ---
    ```
4.  **写正文**：在第二个 `---` 之后开始写你的 Markdown 内容。

### 3. 如何在文章中添加图片？
1.  **准备图片**：把图片（如 `pic1.jpg`）直接丢进该文章的文件夹里。
2.  **引用图片**：在 `index.md` 中使用以下语法：
    ```markdown
    ![图片描述](pic1.jpg)
    ```

### 4. 如何更换文章顶部的 Banner（封面图）？
Blowfish 主题会自动识别名为 `feature.*` 或 `cover.*` 的图片作为封面。
1.  **准备图片**：找一张精美的宽图，重命名为 `feature.jpg`（或 `.png`）。
2.  **放置图片**：直接丢进该文章的文件夹里。
3.  **自动显示**：主题会自动将其显示在文章顶部和首页列表的卡片上。

---

## 🎨 第二部分：全站设置与参数列表

所有的配置文件都位于 `config/_default/` 目录下。

### 1. 网站基础信息 (`languages.en.toml`)
控制你是谁，以及网站叫什么。

| 参数名 | 所在位置 | 修改建议 |
| :--- | :--- | :--- |
| `title` | 第 4 行 | 修改为你网站的名字（显示在浏览器标签页）。 |
| `description` | 第 11 行 | 网站的一句话描述（影响 SEO 搜索结果）。 |
| `dateFormat` | 第 13 行 | 日期格式，如 `"2006-01-02"`。 |
| `[params.author].name` | 第 16 行 | 你的大名，会显示在文章底部和首页。 |
| `[params.author].image` | 第 17 行 | 头像路径。建议把头像放在 `assets/img/avatar.png`，此处填 `"img/avatar.png"`。 |
| `[params.author].headline` | 第 18 行 | 个人简介的一句话标题。 |
| `[params.author].bio` | 第 19 行 | 详细的自我介绍。 |

### 2. 主题外观设置 (`params.toml`)
控制网站“长什么样”。

| 参数名 | 所在位置 | 可选值与说明 |
| :--- | :--- | :--- |
| **`colorScheme`** | 第 8 行 | `blowfish`, `congo`, `ocean`, `forest`, `github` 等。 |
| **`defaultAppearance`** | 第 9 行 | `light` (浅色), `dark` (深色)。 |
| **`layout` (首页)** | 第 29 行 | `page` (简约), `profile` (个人名片), `hero` (大图), `card` (卡片流)。 |
| **`showRecent`** | 第 30 行 | `true`/`false`。是否在首页显示“最近文章”。 |
| **`heroStyle`** | 第 45 行 | 文章顶部的封面样式：`basic` (标准), `big` (大图), `background` (背景图)。 |
| **`showTableOfContents`** | 第 56 行 | `true`/`false`。是否在文章右侧显示目录。 |
| **`showWordCount`** | 第 59 行 | `true`/`false`。是否显示文章字数。 |

### 3. 导航菜单设置 (`menus.en.toml`)
控制顶部那几个点击跳转的按钮。
```toml
[[main]]
  name = "文章"        # 按钮显示的文字
  url = "/posts/"     # 点击跳转的路径
  weight = 1          # 排序权重（越小越靠左）
```

---

## ⚡ 第三部分：一键发布指令（终极步骤）

## ✅ 仓库上传规则（必须遵守）

根据 Hugo 官方目录结构说明：`public/`（构建输出）和 `resources/`（管线缓存）是运行 `hugo` / `hugo server` 时自动生成的目录，Hugo 会按需重建它们，因此**不应上传到仓库**。同理，编辑器/AI 工具的本地配置也不应进入仓库。

### 允许上传（网站源文件）
- `content/`：文章与页面内容（含 Page Bundle 图片/附件）
- `config/`：站点配置（含 `config/_default/*.toml`）
- `layouts/`、`assets/`、`static/`、`archetypes/`：模板/资源/静态文件/内容模板
- `themes/`：主题源码（若你选择“主题随仓库管理”；如果改用 Hugo Module 或 submodule，则以对应方式管理）
- 文档类：`README.md`、`MANUAL.md`、`THEME_CONFIG.md` 等

### 禁止上传（生成物/缓存/本地环境）
- `public/`：站点构建产物（由 CI/Cloudflare Pages 构建生成）
- `resources/`：Hugo Pipes 缓存
- `.hugo_build.lock`：Hugo 构建锁文件
- `.vscode/`、`.idea/`、`.claude/`：本地工具配置
- `node_modules/`：前端依赖（如果你在主题目录执行过 npm 安装）
- `.env*`、`*.key`、`*.pem`：环境变量与密钥文件

### 永远不要做
- 不要为了省事把“生成结果”提交进仓库（例如把 `public/` 提交上去）。
- 不要无脑 `git add .` 后直接提交，必须先 `git status` 复查。

当你完成了以上任何修改，请依次在终端运行这三行代码。**不要思考，照着打：**

0.  **先检查这次会提交什么**：
    ```powershell
    git status --short
    ```
    确认列表里只包含网站源文件的变更（尤其不能出现 `public/`、`resources/`、`.vscode/` 等）。

1.  **把需要的改动加入暂存区**：
    ```powershell
    git add -A
    ```
2.  **给这次修改起个名字**（引号里随便写）：
    ```powershell
    git commit -m "update my blog"
    ```
3.  **把代码送到 GitHub 上去发布**：
    ```powershell
    git push
    ```

---

## 🆘 第四部分：防坑检查清单

- [ ] **文件名**：文件夹和图片名**严禁使用中文**，建议全部小写英文加中划线（如 `my-photo-2024.jpg`）。
- [ ] **草稿状态**：如果发现文章不显示，检查头部是不是写了 `draft: true`。必须改为 `draft: false`。
- [ ] **强制刷新**：有时候改了没生效，是因为浏览器缓存。请按下 `Ctrl + F5`。
- [ ] **图片引用**：在文章里引用图片，直接写文件名即可（如 `pic.jpg`），不需要写长长的路径，前提是你用了“文章文件夹”模式。

---
*Powered by Trae - 您的全能编程助手*
