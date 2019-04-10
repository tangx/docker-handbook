#!/bin/bash
#
# filename: container-pid.sh
#

printf "%-8s %-16s %s\n" 容器PID 容器ID 容器Name
for ContainerID in $(docker container ls -q)
do
{
    ContainerPID=$(docker container inspect ${ContainerID} -f '{{.State.Pid}}')
    ContainerName=$(docker container ls --filter "id=${ContainerID}" --format '{{.Names}}')

    # printf "%-40s %s\n" "server name :"  ".........  $lnode"
    printf "%-8s %-16s %s\n" $ContainerPID $ContainerID $ContainerName

}
done
