FROM apache/dolphinscheduler-worker:3.0.0-beta-1
RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/libs/
RUN ls -al /opt/dolphinscheduler/libs

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh
