FROM openjdk
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN pwd && ls
RUN cat ./mvnw
RUN ./mvnw dependency:resolve
CMD ["./mvnw", "spring-boot:run"]