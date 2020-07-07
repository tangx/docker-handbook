# dragonfly

## supernode

1. supernode 是下载节点，所有 client 请求下载的时候，都从所连接的 supernode 上先下载，并发送到 client 上。
2. 所有 client 与 supernode 之间形成一个 p2p 网络，即，文件第二次下载，才更快。

## dfdaemon

1. dfdaemon 是专为容器网络实现的代理工具，连接 supernode 转发请求。
2. dfdaemon 代理私有仓库时，需要针对 docker proxy 进行额外的配置。
  1. dfdaemon.yml 参数配置
  2. dfdaemon 默认**不** 支持代理私有仓库，所以需要设置 `/etc/systemd/system/service.docker.d/http-proxy.conf` 实现代理下载。
3. 如果代理公有仓库，需要在 `/etc/docker/daemon.json` 中配置 `registry-mirrors` **(注意不是 `insecure-registries`)**。 `{registry-mirrors: ["http://127.0.0.1:65001"]}`

## dfget

1. dfget 是一个下载工具，类似 wget。 可以指定supernode 的下载端口 `--node supernode:8001` 后通过 supernode 代理下载。
