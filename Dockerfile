#IMAGE
FROM maven:3.8.5-openjdk-17 AS build
#JAR
COPY . .
#COMANDO DE INICIO
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/mvp-p2p-ticket-sells-0.0.1-SNAPSHOT java-app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","java-app.jar"]