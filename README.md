
# Payara 5 s2i Builder for OpenShift

The s2i-payara builder simplifies build, configuration and deployment of ThinWARs in cloud native environments like OpenShift and docker.

## Getting started

The s2i-payara inherits from the [payara5-s2i](https://github.com/AdamBien/docklands/tree/master/payara5-s2i) and indirectly [java8-s2i](https://github.com/AdamBien/docklands/tree/master/java/java8-s2i) docker images from [Docklands](https://github.com/AdamBien/docklands/). The base CentOS 7 operating system, Java and Payara 5 are inherited.

Instead of building the universe, `s2i-payara` configures the Payara 5 server using stock [pre-boot scripts](https://docs.payara.fish/documentation/payara-micro/asadmin/pre-and-post-boot-scripts.html), copies 3rd-party libraries like e.g. JDBC-drivers and deploys a ThinWAR from the local folder. 

Also checkout the [thin.war](https://github.com/AdamBien/s2i-payara/tree/master/sample) example.

#### Payara configuration

Create a *asadmin-preboot* or *asadmin-postboot* scripts to configure the application server: [https://docs.payara.fish/documentation/payara-micro/asadmin/pre-and-post-boot-scripts.html](https://docs.payara.fish/documentation/payara-micro/asadmin/pre-and-post-boot-scripts.html)

## Building the builder

The build is based on Payara5 s2i base image from [docklands](https://github.com/AdamBien/docklands/tree/master/payara-s2i), published to 
dockerhub `airhacks/payara-s2i:5.184`. 

1. Clone `https://github.com/AdamBien/docklands.git`
2. `cd java/java8-s2i/` and `docker build -t airhacks/java-s2i .` 
3. `cd payara-s2i` and `docker build -t airhacks/payara-s2i:5.184`

Now build the builder:

1. `git clone https://github.com/AdamBien/s2i-payara`
2. `docker build -t airhacks/s2i-payara .`

## Installing on OpenShift

1. Import the image into an image stream: `oc import-image s2i-payara --from=airhacks/s2i-payara:latest --confirm`
2. Create an app from the imported image: `oc new-app s2i-payara:latest~/. --name=thinwar`
3. Start a build: `oc start-build --from-dir . thinwar` from a directory with the following contents:

| File                   | Required? | Description                                                  |
|------------------------|-----------|--------------------------------------------------------------|
| *.war                  | Yes       | The ThinWar / microservice                                   |
| ext/*.jar              | No        | JDBC drivers and external libraries                          |
| asadmin-preboot        | No        | Payara configuration preeboot script                         |
| asadmin-postboot       | No        | Payara configuration postboot script                         |
| env-file               | No        | Build-time env-entries                                       |

Also see a [ThinWAR example](https://github.com/AdamBien/s2i-payara/tree/master/sample) 

## s2i in action

[![ThinWARs with Payara and OpenShift](https://i.ytimg.com/vi/_23CgD7bsUc/mqdefault.jpg)](https://www.youtube.com/embed/_23CgD7bsUc?rel=0)
