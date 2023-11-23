FROM ubuntu:20.04

LABEL name="Ansible Linux Container"
LABEL description="This is a Linux container designed to run Ansible."

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y  python3-pip python3 sshpass git openssh-server  vim && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN DEBIAN_FRONTEND=noninteractive python3 -m pip install --upgrade pip cffi && \
    pip install ansible-core && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

RUN mkdir /var/run/sshd

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]

COPY sshd_config /etc/ssh/sshd_config

RUN echo 'root:password' | chpasswd


RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

