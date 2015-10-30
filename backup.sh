#!/bin/bash
#备份项目文件
tar -zcvf /var/backup/backup_$(date +"%Y%m%d_%H%M%S").tar.gz /var/xxx/

#停止tomcat
/tomcat80/bin/shutdown.sh 

#获取tomcat进程ID,如果显示项目还存在就直接kill杀掉项目
ps -ef |grep java
#关闭项目
kill -9 pid

#以下命令根据每次上的项目不同要修改路径的
#删除旧的项目文件
rm -rf /var/xxx/ROOT/
#复制测试后代码
scp -r root@x.x.x.x.x:/var/xxx/ROOT/  /var/xxx/ROOT/

#重启项目
/tomcat80/bin/startup.sh
