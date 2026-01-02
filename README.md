# Hugo + Blowfish 主题网站

这是一个使用 [Hugo](https://gohugo.io/) 静态网站生成器和 [Blowfish](https://nunocoracao.github.io/blowfish/) 主题构建的个人网站。

## 🚀 部署到 GitHub Pages

网站已配置自动部署到 GitHub Pages。每次推送到 `main` 分支时会自动触发构建和部署。

### 首次部署步骤

1. **创建 GitHub 仓库**
   - 在 GitHub 上创建一个新仓库（例如：`username.github.io` 或任意名称）
   - 不要初始化 README、.gitignore 或 LICENSE

2. **关联远程仓库**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/你的仓库名.git
   git push -u origin main
   ```

3. **启用 GitHub Pages**
   - 进入仓库的 Settings → Pages
   - Source 选择：**GitHub Actions**
   - 保存后，等待 Actions 工作流自动运行

4. **访问网站**
   - 仓库名为 `zh1227.github.io`：访问 `https://zh1227.github.io`
   - 其他仓库名：访问 `https://zh1227.github.io/repository-name`

## 📝 本地开发

```bash
# 启动本地开发服务器
hugo server -D

# 访问 http://localhost:1313
```

## 📂 项目结构

- `config/_default/` - 网站配置文件
- `content/posts/` - 博客文章
- `themes/blowfish/` - Blowfish 主题
- `static/` - 静态资源
- `.github/workflows/` - GitHub Actions 部署配置

## 📖 更多信息

- [Hugo 文档](https://gohugo.io/documentation/)
- [Blowfish 主题文档](https://nunocoracao.github.io/blowfish/docs/)
- 详细配置请查看 [MANUAL.md](MANUAL.md)
