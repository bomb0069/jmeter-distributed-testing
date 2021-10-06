# JMeter Distributed Testing

## JMeter Disributing

![Distributed JMeter - One controller node with multiple worker nodes](https://jmeter.apache.org/images/screenshots/distributed-jmeter.svg)

![Distributed JMeter - Categories of systems](https://jmeter.apache.org/images/screenshots/distributed-names.svg)

## Create Docker Image

```shell
docker image build -t bomb0069/jmeter .
```

## Run

### Prepare Server

```shell
cd jmeter-script

create-rmi-keystore.sh -dname 'CN=jmeter'
```

### Start Client

```shell

cd jmeter-script

curl --output rmi_keystore.jks http://jmeter-server/reports/guest20/rmi_keystore.jks 

jmeter-server
```

### Run On Server

```shell

jmeter -n -t google-1-thread.jmx -l google-1-thread.jtl -e -o google-1-thread -R load-injector-1,load-injector-2

```

## Reference

- [บันทึกการทำ JMeter Distributed Testing ด้วย Docker Swarm](https://www.somkiat.cc/jmeter-distributed-testing-with-docker-swarm/)
- [Apache JMeter Distributed Testing Step-by-step](https://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.html)
