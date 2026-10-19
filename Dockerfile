FROM eclipse-temurin:17-jdk-alpine
WORDIR /app
COPY xyz.java /app
RUN javac xyz.java
CMD ["java","xyz"]
