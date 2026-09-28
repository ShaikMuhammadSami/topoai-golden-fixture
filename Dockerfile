FROM busybox@sha256:b7f3d86d6e84fc17718c48bcde1450807faa2d56704205c697b4bd5df7b9e29f

COPY --chown=65532:65532 fixture_state.txt /opt/topo/fixture_state.txt
COPY --chown=65532:65532 www/index.html /www/index.html

RUN state="$(cat /opt/topo/fixture_state.txt)" \
    && case "$state" in healthy|fail) ;; *) exit 64 ;; esac \
    && chmod 0444 /opt/topo/fixture_state.txt /www/index.html

USER 65532:65532
EXPOSE 8080

CMD ["sh", "-c", "state=$(cat /opt/topo/fixture_state.txt); case \"$state\" in healthy) exec httpd -f -p 8080 -h /www ;; fail) echo 'synthetic fixture failure' >&2; exit 42 ;; *) echo 'invalid fixture state' >&2; exit 64 ;; esac"]
