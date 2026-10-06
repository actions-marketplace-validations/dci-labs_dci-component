FROM registry.access.redhat.com/ubi9/ubi-minimal@sha256:5ed244b62bbf4095080144d9d35eb8fcd3d39a9801f94aadd63b9d10978a01ae

RUN rpm --import https://dci-packages-prod.s3.amazonaws.com/RPM-GPG-KEY-distributedci-el9 && \
    rpm -iv https://packages.distributed-ci.io/dci-release.el9.noarch.rpm
RUN microdnf install -y \
  python3 \
  jq \
  python3-dciclient && \
  dcictl --version

COPY --chmod=0555 add-component /

ENTRYPOINT [ "/add-component" ]
