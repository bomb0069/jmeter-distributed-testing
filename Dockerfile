FROM openjdk:11-jre-stretch

RUN curl -s https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.2.1.tgz | tar xz

ADD google-1-thread.jmx /jmeter/sample.jmx

WORKDIR /jmeter
RUN /apache-jmeter-5.2.1/bin/create-rmi-keystore.sh -dname 'CN=jmeter'
RUN cp rmi_keystore.jks /apache-jmeter-5.2.1/bin/

EXPOSE 1099
EXPOSE 1100

ENTRYPOINT ["/apache-jmeter-5.2.1/bin/jmeter"]

CMD ["-j", "/dev/stdout", "-s", \
     "-Dserver_port=1099", "-Jserver_rmi_localport=1100"]