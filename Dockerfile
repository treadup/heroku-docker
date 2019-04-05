FROM node:10.15.3 as builder

WORKDIR /build
COPY . /build
RUN yarn build

FROM nginx:1.14.2
COPY --from=builder /build/dist /usr/share/nginx/html/
