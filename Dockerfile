FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:e5161a7d7d99cf22e4f34b72e111211a399d956d9b0e8714da18e9c4c8151041

RUN rpm --import https://dci-packages-prod.s3.amazonaws.com/RPM-GPG-KEY-distributedci-el9 && \
    rpm -iv https://packages.distributed-ci.io/dci-release.el9.noarch.rpm
RUN microdnf install -y \
  python3 \
  jq \
  python3-dciclient && \
  dcictl --version

COPY --chmod=0555 add-component /

ENTRYPOINT [ "/add-component" ]
