FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn

COPY mvnw pom.xml ./

RUN ./mvnw  install

COPY ./target/SampleApi-0.0.1-SNAPSHOT.jar demo.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","demo.jar"]
