# syntax=nobidev/dockerfile
FROM python:3.7

WORKDIR /build/
COPY ./ ./

RUN python3 setup.py install
RUN ./packaging/create_zipapp.py --outfile meson --interpreter '/usr/bin/env python3' ./

FROM python:3.7
COPY --from=0 /build/meson /usr/local/bin/

ENTRYPOINT [ "meson" ]
