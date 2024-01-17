FROM eclipse-temurin:project
RUN mkdir /app
COPY target/ProjectAkhir.jar /app
CMD ["java", "-jar", "/app/ProjectAkhir.jar"]