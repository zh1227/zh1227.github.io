# 🛠️ Blowfish 主题深度配置手册 (开发者级)

本手册旨在帮助您深度定制网站的外观、功能和行为。如果您需要修改网站的整体样式、功能模块或全局参数，请参考本手册。

---

## 📂 一、 配置文件结构

所有网站级别的设置都存放在 `config/_default/` 目录下：

| 配置文件 | 作用说明 |
| :--- | :--- |
| **hugo.toml** | **核心配置**：包含网站 URL、分页、SEO 全局设置等。 |
| **params.toml** | **主题参数**：外观配色、首页布局、文章显示逻辑、搜索开关等。 |
| **languages.zh-cn.toml** | **语言与个人信息**：网站标题、描述、作者头像、社交链接等。 |
| **menus.zh-cn.toml** | **导航菜单**：页头（Header）和页脚（Footer）的链接配置。 |
| **markup.toml** | **渲染设置**：Markdown 解析逻辑、代码高亮样式等。 |

---

## 🎨 二、 核心外观配置 (`params.toml`)

这是您最常修改的文件，控制着网站的“长相”。

### 1. 基础外观 (Appearance)
*   `colorScheme`: 配色方案。可选值：`blowfish` (默认), `congo`, `ocean`, `forest`, `zen` 等。
*   `defaultAppearance`: 默认模式。`light` (亮色) 或 `dark` (暗色)。
*   `autoSwitchAppearance`: 是否根据系统主题自动切换。建议设为 `true`。

### 2. 页头布局 (Header)
*   `header.layout`: 页头样式。
    *   `basic`: 标准样式，随页面滚动。
    *   `fixed`: 固定在顶部。

### 3. 首页定制 (Homepage)
*   `homepage.layout`: 首页布局模式。
    *   `page`: 显示 `content/_index.md` 的内容。
    *   `profile`: 个人资料卡片模式（最常用）。
    *   `hero`: 大图背景 + 欢迎语。
    *   `card`: 卡片流模式。
*   `homepage.showRecent`: 是否在首页显示最近文章。
*   `homepage.showRecentItems`: 显示最近文章的数量（默认 5）。

### 4. 文章显示逻辑 (Article)
*   `article.heroStyle`: 文章顶部图片样式。
    *   `basic`: 正常宽度图片。
    *   `big`: 全宽大图。
    *   `background`: 图片作为标题背景。
*   `article.showTableOfContents`: 是否显示文章目录（TOC）。
*   `article.showReadingTime`: 是否显示预计阅读时间。
*   `article.showWordCount`: 是否显示字数统计。
*   `article.showAuthor`: 是否显示作者信息。

---

## 👤 三、 网站身份与作者信息 (`languages.zh-cn.toml`)

用于设置 SEO 和个人名片信息。

### 1. 全局身份
*   `title`: 网站名称（显示在浏览器标签页）。
*   `description`: 网站描述（对搜索引擎 SEO 至关重要）。

### 2. 作者名片 (`[params.author]`)
*   `name`: 您的名字。
*   `image`: 头像路径（存放在 `assets/img/logo.png`）。
*   `headline`: 一句话自我介绍。
*   `bio`: 详细的个人简历。
*   `links`: 社交链接数组。例如：
    ```toml
    links = [
      { github = "https://github.com/zh1227" },
      { twitter = "https://twitter.com/..." },
      { email = "mailto:you@example.com" }
    ]
    ```

---

## 🗺️ 四、 导航菜单配置 (`menus.zh-cn.toml`)

控制网页顶部和底部的链接。

*   `[[main]]`: 顶部主菜单。
*   `[[footer]]`: 底部辅助菜单。
*   **参数说明**：
    *   `name`: 显示的文字。
    *   `url`: 链接地址（外部链接或相对路径）。
    *   `pageRef`: 链接到本地文件夹名（如 `posts`）。
    *   `weight`: 排序权重（数字越小越靠左）。

---

## 🌐 五、 多语言与汉化设置

网站目前已配置为**全中文环境**。

### 1. 语言核心配置 (`hugo.toml`)
*   `defaultContentLanguage = "zh-cn"`: 设置默认语言为简体中文。

### 2. 翻译文件映射
*   **配置文件**：使用 `languages.zh-cn.toml` 和 `menus.zh-cn.toml`。
*   **内置文案**：主题会自动读取 `themes/blowfish/i18n/zh-CN.yaml` 中的翻译（如“预计阅读时间”、“字数统计”等）。

### 3. 栏目名称汉化
如果您想修改“博客”或“标签”在面包屑导航中的显示：
*   **博客标题**：修改 `content/posts/_index.md` 中的 `title`。
*   **标签标题**：修改 `content/tags/_index.md` 中的 `title`。

## 🛠️ 六、 高级定制：覆盖主题 (Overrides)

如果您想修改主题的源代码（如改变某个按钮的颜色或位置），**不要直接修改 `themes/` 文件夹**。你应该使用 Hugo 的“覆盖”机制：

1.  **修改样式 (CSS)**:
    *   在根目录下创建 `assets/css/custom.css`。
    *   在里面写 CSS 代码，Hugo 会自动将其编译到网站中。
2.  **修改模板 (HTML)**:
    *   如果你想修改文章页面的结构，找到 `themes/blowfish/layouts/_default/single.html`。
    *   将其复制到根目录下的 `layouts/_default/single.html`。
    *   修改你复制出来的那个文件，Hugo 会优先使用根目录下的版本。

---

## 🔍 七、 调试与本地开发

在做出修改后，如何确保没有出错？

1.  **实时预览**:
    ```bash
    hugo server -D
    ```
    *   访问 `http://localhost:1313`。
    *   修改配置后，页面通常会自动刷新。
2.  **查看错误日志**:
    *   如果终端出现红色报错，请检查最近修改的 `.toml` 文件是否存在语法错误（如漏掉了引号或等号）。
3.  **强制重新编译**:
    *   如果修改了 CSS 但没生效，尝试停止服务器并重新运行 `hugo server --disableFastRender`。

---

## 🚀 八、 修改后如何生效？

1.  **本地检查**：运行 `hugo server` 确保一切如您所愿。
2.  **提交代码**：
    ```bash
    git add .
    git commit -m "feat: 深度定制主题配置"
    git push
    ```
3.  **云端发布**：GitHub Actions 会自动检测到配置修改并重新生成静态网页，约 1-2 分钟后，您的网站就会焕然一新。
