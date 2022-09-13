FROM dolphinscheduler.docker.scarf.sh/apache/dolphinscheduler:2.0.6
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/lib/
RUN ls -al /opt/dolphinscheduler/lib


# install miniconda to /miniconda3/
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh -b
RUN mv /root/miniconda3 /

# COPY common.properties /opt/dolphinscheduler/conf

RUN apt-get update
RUN apt-get install sudo -y

# add some special sudoers
RUN adduser --disabled-password --gecos '' dw
RUN adduser dw sudo

RUN adduser --disabled-password --gecos '' devops
RUN adduser devops sudo

RUN adduser --disabled-password --gecos '' spider
RUN adduser spider sudo

# disable password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN rm -rf /var/lib/apt/lists/*
RUN ln /miniconda3/bin/conda /usr/local/bin/conda
RUN chown -R root:sudo /miniconda3
RUN rm /usr/bin/python
RUN ln /usr/bin/python3.7 /usr/bin/python

RUN pip3 install -U pip setuptools 
RUN pip3 install pymysql pandas logging
