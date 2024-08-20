# dokcerfile多阶段构建语法

# build stage  通过FROM继承镜像的时候 给当前镜像指定一个名字 build-stage
FROM node:18.0-alpine3.14 as build-stage

WORKDIR /app

COPY package.json .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install

COPY . .

RUN npm run build

# production stage
FROM node:18.0-alpine3.14 as production-stage

COPY --from=build-stage /app/dist /app
COPY --from=build-stage /app/package.json /app/package.json

WORKDIR /app

RUN npm config set registry https://registry.npmmirror.com/

# npm install --production 只安装 dependencies 依赖
RUN npm install --production

EXPOSE 3000

CMD ["node", "/app/main.js"]
