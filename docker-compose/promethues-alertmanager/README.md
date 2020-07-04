# prome and alert


## alertmanager

在 alertmanager 0.21.0 中， 默认是开启了 cluster 模式的（应该吧）。 如果不指定 `cluster.listen` 则提示找不到 gissip 地址。
+ 使用 `--cluster.listen-address=` 或 `--cluster.listen-address=127.0.0.1:9094` 关闭。
