FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY target/spring-boot-rest-example-0.5.0.war app.war
EXPOSE 8090 8091
# Run with "test" profile (H2 in-memory DB)
ENTRYPOINT ["java", "-jar", "app.war"]
