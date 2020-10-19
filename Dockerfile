FROM centos:8

ENV container docker
MAINTAINER "Ashutosh Singh" <ashusingh.unch8@gmail.com>

RUN yum install wget --nogpgcheck -y 
RUN yum install https://mirrors.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm -y
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo 
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN  echo "jenkins ALL=(ALL)  NOPASSWD:ALL" >> /etc/sudoers 
RUN yum install net-tools git python36 --nogpgcheck -y
RUN  yum install jenkins --nogpgcheck -y --nobest

CMD java -jar /usr/lib/jenkins/jenkins.war
