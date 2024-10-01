# Node Modules
FROM node:18 as nodemodules

WORKDIR /stuff

COPY package*.json /stuff/

RUN npm ci


# Build
FROM node:18 as build

WORKDIR /app

COPY . /app

COPY --from=nodemodules /stuff/node_modules/ /app/node_modules

RUN npm run build-prod


# Runtime
FROM node:18 as runtime

WORKDIR /app

COPY . /app
COPY entrypoint.sh /entrypoint.sh
COPY --from=build /app/dist/ /app/dist
COPY --from=nodemodules /stuff/node_modules/ /app/node_modules

ENTRYPOINT ["/entrypoint.sh"]
