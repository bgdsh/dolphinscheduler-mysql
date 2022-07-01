FROM apache/dolphinscheduler-tools:3.0.0-beta-1
RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
RUN mkdir /opt/dolphinscheduler/libs
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/libs/
RUN ls -al /opt/dolphinscheduler/libs