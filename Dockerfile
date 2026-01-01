# Stage 1: Build
FROM hugomods/hugo:latest AS builder

# 设置工作目录
WORKDIR /src

# 复制项目文件
COPY . .

# 构建静态文件
RUN hugo --minify

# Stage 2: Serve
FROM nginx:alpine

# 复制构建好的静态文件到 Nginx 目录
COPY --from=builder /src/public /usr/share/nginx/html

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]
