FROM openjdk as maven
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN chmod +x mvnw
RUN ./mvnw clean
RUN ./mvnw dependency:resolve
RUN ./mvnw -X
EXPOSE 8080
CMD ["./mvnw", "spring-boot:run"]