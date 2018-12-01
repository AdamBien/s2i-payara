FROM airhacks/payara5
LABEL maintainer="Adam Bien, airhacks.com"

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Payara 5 S2I Image" \
      io.k8s.display-name="Payara 5 S2I Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,airhacks,payara,payara5, javaee" \
      io.openshift.s2i.scripts-url="image://${INSTALL_DIR}/s2i/bin"



ADD ./s2i/bin/ ${INSTALL_DIR}/s2i/bin
USER root
#RUN chown -R 1001:1001 ${INSTALL_DIR}/s2i/bin/
RUN chmod a+x ${INSTALL_DIR}/s2i/bin/*

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001
