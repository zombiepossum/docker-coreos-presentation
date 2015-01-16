FROM dockerfile/java:oracle-java8
MAINTAINER Joe Muraski
EXPOSE 8080

ADD user-app/build/libs/user-service-0.1.0.jar /data/user-service-0.1.0.jar

CMD java -jar user-service-0.1.0.jar
