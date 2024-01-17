FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/ProjectAkhir.jar /app
CMD ["java", "-jar", "/app/ProjectAkhir.jar"]