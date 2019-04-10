# tini

https://github.com/krallin/tini

> NOTE: If you are using Docker 1.13 or greater, Tini is included in Docker itself. This includes all versions of Docker CE. To enable Tini, just pass the --init flag to docker run.

```bash
$ docker run --init -itd nginx:1.15-alpine

$ deti thirsty_mestorf ps -ef
PID   USER     TIME  COMMAND
    1 root      0:00 /dev/init -- nginx -g daemon off;
    6 root      0:00 nginx: master process nginx -g daemon off;
    7 nginx     0:00 nginx: worker process
   20 root      0:00 ps -ef
```


```
`杭州-紫光-张馆长  09:44:16`
之前看到有人K8s里pod滚动更新的时候pod都是被强制杀掉收不到信号平滑退出，我叫他进去ps看，最后他说他的dockerfile是插件生成的，CMD是sh格式而不是exec格式

`北京-abc-華安  09:46:00`
prestop

`杭州-紫光-张馆长  09:47:23`
tini了解一下？

`杭州-docker-侃侃  09:47:41`
sh 脚本形式收不到信号平滑退出么？
`杭州-紫光-张馆长  09:48:17`
docker stop的时候是向容器pid为1的发送信号(缺省SIGTERM)
`杭州-紫光-张馆长  09:49:20`
很多人主进程是个sh，sh不会转发信号，另外有些业务进程前台跑下代码里有fork的没有处理僵尸进程，tini和dumb_init可以承担pid为1维持生存周期，另外可以转发信号，还可以处理僵尸和孤儿进程
`杭州-紫光-张馆长  09:53:16`
你可以看看jenkins里pid为1的是啥，还有ingress-nginx里
```
