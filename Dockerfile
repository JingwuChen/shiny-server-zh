#Version 0.0.1
FROM quantumobject/docker-shiny
MAINTAINER Jingwu Chen "chenjinwu1990@gmail.com"
RUN apt-get update && apt-get upgrade && apt-get install -y -q libssl-dev  libxml2-dev git vim
RUN  R -e "install.packages('rvest', repos='http://cran.rstudio.com/')"
RUN locale-gen zh_CN.UTF-8
RUN echo "export LC_ALL='zh_CN.UTF-8'">>/root/.bashrc && echo "export LANG='zh_CN.UTF-8'">>/root/.bashrc && \
      echo "export LANGUAGE='zh_CN.UTF-8'">>/root/.bashrc
RUN echo "export LC_ALL='zh_CN.UTF-8'">>/home/shiny/.bashrc && echo "export LANG='zh_CN.UTF-8'">>/home/shiny/.bashrc && \
      echo "export LANGUAGE='zh_CN.UTF-8'">>/home/shiny/.bashrc  && echo 'Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")'>>/etc/R/Rprofile.site
