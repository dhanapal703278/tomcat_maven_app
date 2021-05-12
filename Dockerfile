FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT/
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps/ROOT/ 
RUN cd /usr/local/tomcat/webapps/ROOT && unzip java-tomcat-maven-example.war && \
    rm -rf /usr/local/tomcat/webapps/ROOT/java-tomcat-maven-example.war
EXPOSE 80
CMD ["catalina.sh", "run"]
