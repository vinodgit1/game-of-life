FROM tomcat
MAINTAINER sankar
ARG CONT_IMG_VER
WORKDIR /usr/local/tomcat
EXPOSE 8080
ADD  http://13.59.210.12:8081/nexus/service/local/artifact/maven/redirect?r=releases&g=com.wakaleo.gameoflife&a=gameoflife&p=war&v=LATEST /usr/local/tomcat/webapps/gameoflife.war
