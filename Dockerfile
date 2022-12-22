FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN chmod +x mvnw
RUN ./mvnw clean
RUN ./mvnw dependency:resolve
EXPOSE 8080
CMD ["./mvnw", "spring-boot:run"]