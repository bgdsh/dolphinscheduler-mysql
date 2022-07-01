FROM apache/dolphinscheduler-api:3.0.0-beta-1
RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/libs/
RUN ls -al /opt/dolphinscheduler/libs
COPY common.properties /opt/dolphinscheduler/conf
