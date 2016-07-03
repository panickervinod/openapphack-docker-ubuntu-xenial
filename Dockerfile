FROM ubuntu:16.04
MAINTAINER vinod.panicker@wipro.com
RUN apt-get update

#RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
# && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
# && apt-get update \
# && DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip \
# && rm -rf /var/lib/apt/lists/*

 # Install Ansible
 RUN apt-get install -y software-properties-common git
 # The ansible repository does not provide deb packages for Xenial yet
 # https://github.com/ansible/ansible/issues/15524
 # RUN apt-add-repository -y ppa:ansible/ansible
 RUN apt-get update
 RUN apt-get install -y ansible ufw curl vim.tiny wget sudo net-tools ca-certificates unzip

 COPY initctl_faker .
 RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

 # Install Ansible inventory file
 RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
