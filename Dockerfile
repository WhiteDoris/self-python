# 使用官方 Python 镜像作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的 /app 目录
COPY . /app


# 安装 vim & 清理不再需要的文件，减小镜像大小
RUN mv /app/sources.list /etc/apt/ \
    && rm -f /etc/apt/sources.list.d/debian.sources \
    && apt-get update && \
    apt-get install -y vim telnet iputils-ping make procps\
    # 设置时区为上海（可替换其他时区）
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/lib/apt/lists/* \



# 需要在增加一个makefile命令


# 安装项目依赖
RUN pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --no-cache-dir -r requirements.txt



# 设置环境变量
ENV PYTHONUNBUFFERED=1

# 暴露端口（如果需要）
EXPOSE 8000

# 运行命令
CMD ["sh", "-c", "while true; do echo 'Running...'; sleep 10; done"]