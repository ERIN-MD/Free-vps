FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# تثبيت الحزم الأساسية وخادم SSH
RUN apt update -y && apt install -y \
    openssh-server \
    sudo \
    vim \
    curl \
    wget \
    git \
    net-tools \
    htop \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# إعداد خادم SSH
RUN mkdir /var/run/sshd

# ضبط كلمة السر لحساب root (قم بتغيير MyPassword123# بكلمة سر من اختيارك)
RUN echo "root:Boudy1490$" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
