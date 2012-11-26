service-installer
===================

本项目提供相关服务的一键安装功能，使用方法如下：
1、阅读system-required.txt，按照步骤安装其中指定的公共库，这些库需要以root身份，安装在系统的默认路径中。

2、目录规划
每个服务均会在conf.sh中定义HOME_PATH路径，一般取值为当前用户的Home路径，线上程序一般是/home/worker，
相对独立的服务都会在HOME_PATH建一个自己的目录，然后把自己的文件安装在这个子目录中，如nginx相关的文件都
会在$HOME_PATH/nginx目录下，这样可以保持目录的清晰可管理。对于多个服务都需要的依赖库或者工具，一般请安
装在$HOME_PATH/lib下，一般运行./configure时加上--prefix=$HOME_PATH/lib即可。$HOME_PATH/lib目录下会
再包含lib、bin、include等子目录。

3、安装具体的服务程序，以安装nginx为例：
A）修改conf.sh配置文件开头的目录和用户相关的宏定义值

B）执行install.sh

C) 完成安装后，默认的配置文件nginx.conf+upstream.conf是用于和PHP配合使用，如果nginx是作为反向代理服务器，
请使用nginx.conf.proxy这个配置。
