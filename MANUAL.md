# 🌐 Blowfish 网站完整使用与操作手册

本手册为您提供 Blowfish 主题网站的**全量参数说明**、日常维护及高级功能配置指南。

---

## 📍 当前站点状态 (Current Status)

目前您的站点正在使用 **`layout = "page"`** 极致简约布局。

- **效果**：移除了首页所有的背景图、大标题和头像块，直接将“最近的文章”置顶显示。
- **关联文件**：
    - 配置：[params.toml](config/_default/params.toml) -> `layout = "page"`
    - 内容：[content/_index.md](content/_index.md) (保持为空以消除首页文字)

---

## 🛠 一、 全局站点配置 (hugo.toml)
*控制网站的基础行为和元数据。*

| 参数 | 说明 | 默认值/示例 |
| :--- | :--- | :--- |
| `baseURL` | 网站部署后的完整域名 | `"https://your-site.com/"` |
| `theme` | 指定使用的主题名称 | `"blowfish"` |
| `defaultContentLanguage` | 默认语言 | `"en"` |
| `[pagination].pagerSize` | 每页显示的文章数量 | `20` |
| `summaryLength` | 首页文章摘要的字数限制 | `30` |
| `enableEmoji` | 是否在文章中支持 Emoji 表情 | `true` |
| `buildDrafts` | 是否构建标记为 draft (草稿) 的文章 | `false` |

---

## 🎨 二、 主题功能配置 (params.toml)
*核心功能开关，决定网站“长什么样”。*

### 1. 基础外观 (Global)
- `colorScheme`: 配色方案。可选：`blowfish` (默认), `congo`, `ocean`, `forest` 等。
- `defaultAppearance`: 默认外观模式。可选：`light` (浅色), `dark` (深色)。
- `autoSwitchAppearance`: 是否根据系统设置自动切换深浅色。
- `enableSearch`: 是否开启右上角全局搜索。
- `enableCodeCopy`: 代码块是否显示一键复制按钮。

### 2. 导航栏设置 (Header)
- `layout`: 导航栏布局。
    - `fixed`: 固定在顶部，随页面滚动。
    - `basic`: 随页面滚动而消失。

### 3. 页脚设置 (Footer)
- `showCopyright`: 是否显示版权信息。
- `showThemeAttribution`: 是否显示主题来源声明。
- `showAppearanceSwitcher`: 是否显示深浅色切换按钮。
- `showScrollToTop`: 是否显示回到顶部按钮。

### 4. 首页设置 (Homepage)
- `layout`: **(核心)** 首页展示模式。
    - `page`: **(当前使用)** 使用 `_index.md` 内容，最简约。
    - `card`: 纯文章卡片流。
    - `hero`: 大图欢迎背景 + 标题。
    - `profile`: 个人头像 + 简介居中。
- `showRecent`: 是否在首页显示“最近的文章”列表。
- `showRecentItems`: 首页显示的最近文章数量（默认 5）。
- `cardView`: 首页文章是否以卡片形式展示（false 为列表）。

### 5. 文章页面设置 (Article)
- `showDate`: 显示发布日期。
- `showReadingTime`: 显示预计阅读时间。
- `showWordCount`: 显示总字数。
- `showTableOfContents`: 开启文章右侧/顶部目录。
- `heroStyle`: 详情页顶部封面样式 (`basic`, `big`, `background`)。
- `showAuthor`: 页面底部是否显示作者信息卡片。

---

## 👤 三、 个人信息与多语言 (languages.en.toml)
*定义您是谁，以及站点显示的文字内容。*

### 1. 站点元数据
- `title`: 网站名称（显示在浏览器标签页）。
- `description`: 网站描述（对 SEO 非常重要）。
- `dateFormat`: 日期格式（如 `"2 January 2006"`）。

### 2. 作者信息 (params.author)
- `name`: 您的名字。
- `image`: 头像路径（存放于 `assets/img/`）。
- `headline`: 一句话简介。
- `bio`: 详细的自我介绍。
- `links`: 社交链接列表（支持 GitHub, Twitter, Email 等）。

---

## 📝 四、 日常维护操作流程

### 1. 发布新文章
```mermaid
graph TD
    A[执行命令 hugo new] --> B[编辑 posts/ 下的 .md 文件]
    B --> C[设置 Front Matter 标题/日期]
    C --> D[将 draft 设为 false]
    D --> E[Git Push 自动部署]
```

### 2. 常用维护命令 (Docker)
| 命令 | 用途 |
| :--- | :--- |
| `docker-compose restart hugo-dev` | **最常用**：修改配置后强制刷新页面 |
| `docker logs -f hugo-dev` | 查看报错信息（如网页打不开时） |
| `docker exec -it hugo-dev hugo new posts/xxx.md` | 在容器内创建新文章文件 |

---

## 🚀 五、 进阶：内容增强组件 (Shortcodes)
*在 Markdown 中直接复制以下代码使用。*

- **警告框 (Alert)**: `{{< alert icon="fire" >}} 提示文字 {{< /alert >}}`
- **按钮 (Button)**: `{{< button href="链接" >}} 文字 {{< /button >}}`
- **流程图 (Mermaid)**: `{{< mermaid >}} graph TD; A-->B; {{< /mermaid >}}`

---

*更多技术细节请查阅：[Blowfish 官方配置文档](https://nunocoracao.github.io/blowfish/docs/configuration/)*
