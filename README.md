+ 一般情况下，我们都会用多阶段构建 + alpine 基础镜像
+ 多阶段构建也能减少镜像体积 build 一个镜像、production 一个镜像，最终保留下 production 的镜像
+ docker build 的时候会把构建上下文的所有文件打包发送给 docker daemon 来构建镜像
+ 可以通过 .dockerignore 指定哪些文件不发送，这样能加快构建时间，减小镜像体积
+ 我们一般使用 alpine 的基础镜像，类似 node:18.10-alpine3.14，这样构建出来镜像体积会小很多