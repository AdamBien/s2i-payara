
# Payara 5 s2i Builder for OpenShift

## Getting started



### Files and Directories  
| File                   | Required? | Description                                                  |
|------------------------|-----------|--------------------------------------------------------------|
| *.war                  | Yes       | The ThinWar / microservice                                   |
| ext/*.jar              | No        | JDBC drivers and external libraries                          |
| asadmin-preboot        | Yes       | Payara configuration script                                  |
| env-file               | Yes       | Build-time env-entries                                       |

#### Serverconfiguration

Create a *asadmin-preboot* scripts to configure the application server: [https://docs.payara.fish/documentation/payara-micro/asadmin/pre-and-post-boot-scripts.html](https://docs.payara.fish/documentation/payara-micro/asadmin/pre-and-post-boot-scripts.html)

## Building the builder

The build is based on Payara5 s2i base image from [docklands](https://github.com/AdamBien/docklands/tree/master/payara5-s2i), published to 
dockerhub `airhacks/payara5-s2i:183`. 

1. Clone `https://github.com/AdamBien/docklands.git`
2. `cd java/java8-s2i/` and `docker build -t airhacks/java-s2i . 
3. `cd payara5-s2i` and `docker build -t airhacks/payara5-s2i:183`

Now build the build itself:

1. `git clone https://github.com/AdamBien/s2i-payara`
2. `docker build -t airhacks/s2i-payara .`
