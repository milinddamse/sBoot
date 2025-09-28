FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Step 2: Run the Spring Boot WAR with JDK 8
FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/spring-boot-rest-example-0.5.0.war app.war
EXPOSE 8090 8091
# Run with "test" profile (H2 in-memory DB)
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=test", "app.war"]
