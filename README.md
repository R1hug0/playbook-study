# playbook-study
互联网收集并整理的一些ansible例子,基于CentOS x86_64,版本在6及以上,
有需要的可以看看.
roles下面缺失的.tar.gz文件在vars/main.yml里面都能找的到,主要是根据变量去安装指定版本的,不同版本定制更改下
变量名称就可以了
用法:
ansible-playbook  xxx_install.yml -C -l local -e which_srv=local  ##-C类似DEBUG功能,演示执行,正式执行去掉此参数

感谢
    dl528888
