FROM anapsix/alpine-java 

MAINTAINER pchen2145

COPY ./target/gs-spring-boot-0.1.0.jar .

EXPOSE 7777

# CMD ["java","-jar","gs-spring-boot-0.1.0.jar"]

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","./gs-spring-boot-0.1.0.jar"]

