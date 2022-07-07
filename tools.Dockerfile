FROM apache/dolphinscheduler-tools:2.0.5
RUN curl -O \
    "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.16/mysql-connector-java-8.0.16.jar"
# follow the official doc
RUN mkdir -p /opt/dolphinscheduler/lib
RUN cp mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/lib/

# guess the real path
RUN mv mysql-connector-java-8.0.16.jar /opt/dolphinscheduler/tools/libs/
RUN ls -al /opt/dolphinscheduler/lib