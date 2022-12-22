FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
CMD ["ls"]
#RUN ./mvnw dependency:resolve
#CMD ["./mvnw", "spring-boot:run"]