FROM quay.io/keycloak/keycloak:25.0 AS builder

WORKDIR /opt/keycloak

COPY ./dist_keycloak/keycloak-theme-for-kc-22-to-25.jar /opt/keycloak/providers/

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=mysql

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:25.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENV KC_DB=mysql
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
