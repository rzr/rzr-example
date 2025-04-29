FROM busybox:latest as builder
RUN mkdir -p /local/tmp && dd bs=100M count=1 of=/local/tmp/tmp.tmp if=/dev/urandom

FROM busybox:latest
# COPY --from=builder /tmp.tmp /
RUN \
  --mount=type=bind,from=builder,source=/local/tmp,target=/local/tmp \
  md5sum /local/tmp/tmp.tmp | tee /README

# https://rabbithole.wwwdotorg.org/2021/03/02/1-avoiding-docker-add-copy-layers.html