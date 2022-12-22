FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN chmod +x mvnw
RUN ./mvnw dependency:resolve
CMD ["./mvnw", "spring-boot:run"]