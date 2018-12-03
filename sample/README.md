# ThinWAR Example


1. Install the builder image: [https://github.com/AdamBien/s2i-payara](https://github.com/AdamBien/s2i-payara)
2.`oc new-app s2i-payara:latest~/. --name=thinwar`
3. `oc start-build --from-dir . thinwar`
4. `oc expose svc thinwar --port=8080`

The service is going to be accessible under: 

`http:/[GENERATED_HOST or DNS]/thinwar/resources/ping`