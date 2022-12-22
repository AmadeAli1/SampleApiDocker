FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn

COPY mvnw pom.xml ./

RUN ./mvnw mvn install

COPY ./target/SampleApi-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java","-jar","demo.jar"]
