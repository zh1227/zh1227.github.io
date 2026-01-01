# 🌐 Blowfish 网站完整使用与操作手册

本手册旨在为您提供 Blowfish 主题网站的日常维护、文章发布及高级功能配置的全面指南。

---

## 🛠 一、 基础信息维护

所有的基础配置都位于 `config/_default/` 目录下。

### 1. 修改 Logo 与 站点图标
- **文件路径**：[params.toml](config/_default/params.toml)
- **关键参数**：
    - `logo = "img/logo.png"`: 导航栏显示的 Logo。
- **资源位置**：将图片放入 `assets/img/`。

### 2. 个人信息与社交链接
- **文件路径**：[languages.en.toml](config/_default/languages.en.toml)
- **配置项**：在 `[params.author]` 下修改：
    - `name`: 姓名。
    - `image`: 头像路径（建议 `img/logo.png`）。
    - `headline`: 一句话简介。
    - `bio`: 详细个人描述。
    - `links`: 社交链接，例如 `[{ github = "..." }, { twitter = "..." }]`。

---

## 📝 二、 文章管理 (Content)

### 1. 新建文章
在终端运行以下命令：
```bash
docker exec -it hugo-dev hugo new posts/my-new-post.md
```
这将在 `content/posts/` 下创建一个包含基础元数据的 Markdown 文件。

### 2. 文章目录结构 (Page Bundles)
为了更好地管理图片，建议为每篇文章创建一个独立的文件夹：
```text
content/posts/
└── my-cool-article/
    ├── index.md        # 文章主体内容
    ├── feature.jpg     # 自动识别为文章封面图/Banner
    └── internal.png    # 文章内使用的其他图片
```

### 3. 文章前置配置 (Front Matter)
在 `.md` 文件的顶部，您可以配置文章的元数据：
```markdown
---
title: "我的第一篇文章"
date: 2024-01-01
description: "这篇文章的简短描述"
summary: "显示在列表页的摘要"
tags: ["Hugo", "Blowfish"]
categories: ["教程"]
series: ["我的系列教程"] # 如果属于某个系列
showTableOfContents: true  # 是否显示目录
draft: false               # 是否为草稿
---
```

---

## 🖼 三、 图片与媒体管理

### 1. 修改文章 Banner (封面图)
Blowfish 使用命名约定来自动识别封面图：
- 在文章文件夹内，放置一张名为 `feature.jpg`、`feature.png` 或以 `feature*` 开头的图片。
- **效果**：它会自动出现在文章顶部的 Hero 区域，以及首页的文章卡片上。

### 2. 文章内插图
在 Markdown 中引用同目录下的图片：
```markdown
![图片描述](internal.png)
```

### 3. 首页大图 (Hero 模式)
- **路径**：[params.toml](config/_default/params.toml) -> `[homepage]` -> `homepageImage`。

---

## 🚀 四、 高级功能 (Shortcodes)

Blowfish 提供了丰富的“短代码”来增强 Markdown 的表现力：

### 1. 警告与提示 (Alerts)
```markdown
{{< alert >}}
这是一个普通的提示信息。
{{< /alert >}}

{{< alert icon="fire" cardColor="#ff5733" >}}
这是一个带图标和自定义颜色的警告！
{{< /alert >}}
```

### 2. 按钮 (Buttons)
```markdown
{{< button href="https://google.com" target="_self" >}}
点击这里
{{< /button >}}
```

### 3. 图表与流程图
- **Mermaid**: 支持流程图、时序图等。
- **Chart.js**: 支持饼图、柱状图等。
详细语法请参考 [官方文档短代码部分](https://blowfish.page/docs/shortcodes/)。

---

## ⚙️ 五、 站点维护与开发

### 1. 常用开发命令
- **查看实时日志**：`docker logs hugo-dev --tail 20`
- **重启服务器**：`docker-compose restart hugo-dev`
- **清理并强制重新构建**：
  ```bash
  rm -rf public/
  docker-compose restart hugo-dev
  ```

### 2. 部署到生产环境
当您准备好发布时，运行：
```bash
docker-compose up hugo-prod
```
生成的静态文件将位于 `public/` 目录，您可以将其上传到 GitHub Pages 或 Cloudflare Pages。

---

## 💡 技巧与建议
- **草稿预览**：将文章的 `draft: true` 设置为 `false` 才能在正式环境中看到。在开发环境（hugo-dev）中默认会显示草稿。
- **SEO 优化**：务必为每篇文章填写 `description`，这有助于搜索引擎抓取。
- **多语言**：如果需要增加中文支持，可以在 `config/_default/` 下创建 `languages.zh-cn.toml`。

---
*更多详细信息请访问：[Blowfish 官方文档](https://blowfish.page/zh-cn/docs/)*
