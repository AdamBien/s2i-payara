
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

