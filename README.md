# shiny-server-zh
## 构建镜像
quantumobject/docker-shiny是非常好的shiny server的镜像，可以方便部署R shiny 的web服务器。

本文就是以以其为基础的。但是其镜像缺少一些必要的app，所以本文在此基础添加了必要的vim,git等。另外由于其中不是中文环境，部署的shiny app无法很好的显示中文。所以首先需要改变系统的locale，本人也是参考了好多帖子才更改成功。使用命令`locale-gen zh_CN.UTF-8`生成中文包，然后将下面三个系统变量添加到启动文件`.bashrc`中：
```
export LC_ALL='zh_CN.UTF-8
export LANG='zh_CN.UTF-8
export LANGUAGE='zh_CN.UTF-8
```
Note:必须添加到启动文件中，不然的话就当次有用，下次启动系统时又恢复原状了。更改系统为中文，方便查看带有中文的源代码。

另外还要更改R的locale环境，将`Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")`添加到`/etc/R/Rprofile.site`的末尾去即可。

另外由于本人需要用R进行网络爬虫，需要安装rvest包，但rvest安装需要几个系统文件支持，所以一并安装。

## 使用镜像
使用`sudo docker run -p 3838:3838 -it sohoyizu/shiny_server_zh /bin/bash`命令即可建立镜像了，也可以任意使用shiny server

