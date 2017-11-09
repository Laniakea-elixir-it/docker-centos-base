FROM centos:7.4.1708

MAINTAINER ma.tangaro@ibiom.cnr.it

RUN yum -y install epel-release && \
    yum -y update && \
    yum groupinstall -y "Development Tools" && \
    yum install -y python-pip python-devel libffi-devel openssl-devel &&\
    yum install -y sudo git vim

RUN pip install ansible==2.2.1

# workaround for https://github.com/ansible/ansible/issues/20332
#RUN sed -i 's:#remote_tmp:remote_tmp:' /etc/ansible/ansible.cfg

CMD ["/bin/bash"]
