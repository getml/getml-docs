# later change to main
ARG TAG=update_readme_1_4_0
FROM python:3.11.8-slim AS build
ARG TAG

RUN apt-get update && apt-get install -y git

WORKDIR /monorepo
RUN git clone -n --depth=1 --filter=tree:0 \
-b ${TAG} https://github.com/getml/getml-community /monorepo
RUN git sparse-checkout set --no-cone src/python-api && git checkout

COPY . /documentation

WORKDIR /documentation
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install hatch
RUN hatch config set dirs.env.virtual .venv
RUN hatch env create
RUN hatch run pip install -r requirements.txt

RUN hatch run sphinx-build -b html source html

FROM scratch AS output
ARG VERSION
COPY --from=build /documentation/html $VERSION
