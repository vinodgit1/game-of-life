FROM tomcat
MAINTAINER sankar
ARG CONT_IMG_VER
WORKDIR /usr/local/tomcat
EXPOSE 8080
ADD  /var/lib/jenkins/workspace/game-of-life-proj-cd/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
