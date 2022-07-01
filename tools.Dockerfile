FROM apache/dolphinscheduler-tools:3.0.0-beta-1
RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
RUN mkdir -p /opt/dolphinscheduler/lib
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/lib/
RUN ls -al /opt/dolphinscheduler/lib