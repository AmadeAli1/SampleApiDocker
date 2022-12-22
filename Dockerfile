FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
CMD ["ll"]
#RUN ./mvnw dependency:resolve
#CMD ["./mvnw", "spring-boot:run"]