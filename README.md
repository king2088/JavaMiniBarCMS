# JavaMiniBarCMS
  小型酒吧在线管理系统JavaMinibarCMS是使用Java MVC模式 + Mysql数据库开发的一个小型的文章管理系统【本系统使用GB2312编码开发】。<br />
  其中使用了javamail、Gson、jspSmartUpload以及百度的ueditor进行邮件收发、json数据生成、图片上传、文件编辑等主要功能。本系统的主要功能：文章信息发布功能、商品信息发布、商品的购买和预订、用户个人信息管理、会员上传分享音乐、留言。前端采用jQurey开发实现，包含了Ajax用户登录注册验证等功能。
使用方法
==========
一、数据库配置文件
-----------
数据库配置文件位于WEN-INF目录下的DB.properties，打开此配置文件即可看到如下内容：

    #数据库配置
    #mysql URL
    Mysql_url=jdbc:mysql://localhost:3306/bar
    #mysql用户名
    Mysql_root=root
    #mysql密码
    Mysql_password=123456
    #Mysql_Binpath=G:\XAMPP\mysql\bin mysql的bin目录（此处可填，不填写也不影响使用）
    Mysql_Binpath=
二、Windows系统下安装
-----------
1、如果自己搭建的服务器环境，mysql命令cmd中可执行，那么首先在mysql中创建一个名为bar的数据库《create database bar》，那么，请将database目录下的bar.sql文件放置于C盘根目录。<br />
2、将网站源码下载拷贝到Tomcat服务器上(此处以tomcat为例)。<br />
3、直接在浏览器中输入localhost:8080/install.jsp，根据相应的提示进行数据库sql导入操作即可。<br />
注意：如果是集成环境搭建的服务器，那么请自行使用mysql进行.sql文件的导入。<br />
三、Linux系统下安装
-----------
1、linux系统下，请务必自行执行mysql的sql文件导入命令将bar.sql文件导入到数据库中。<br />
2、linux下链接数据库的java类会存在相应的问题，请大家直接修改src\java\com\bar\db\ConnectDB.java文件并重新编译项目，否则会无法找到DB.properties文件而造成无法链接数据库。找到如下代码：

    /*Windows下使用的获得WEB-INF目录*/
    dir=dir.replace('/', '\\');//windows下将目录中的"/"修改为"\\"
    dir=dir.replace("file:", ""); //去掉file:
    dir = dir.replace("classes\\", ""); //windows下去掉class\\（因为第一次替换就已经将"/"替换为"\\"所以这里必须要写class\\）
    dir = dir.substring(1); //去掉第一个\（windows），Linux下要注释掉
    dir+="DB.properties";
            
    /*Linux请注释掉上面的Windows*/
    /*
    dir=dir.replace("file:", ""); //去掉file:
    dir = dir.replace("classes/", ""); //linux下去掉class/
    dir+="DB.properties";
    */
将Windows下使用的获得WEB-INF目录下的代码注释，并取消linux下代码的注释，即可成功链接数据库。
四、javamail找回密码功能须知
-------------
找回密码功能使用的邮箱是javaminibar@163.com来进行发送密码明文的，如果你想要修改成你自己的邮箱，请找到src\java\com\bar\servlet\GetPwd.java文件中第83行以下的代码进行修改即可！<br />
开发工具
==========
使用netbeans的朋友，如果没有使用tomcat服务器，而是glassfish服务器运行项目的，请将DB.properties放到C:\Users\Administrator\personal_domain\lib目录下，linux平台下的netbeans应该也差不多，找到personal_domain\lib目录即可。
Bug及联系我
============
由于本人时间有限，无法及时更新此java WEB的各种bug，因此大家请自行进行修改和提交更好的意见给我。<br />
个人博客：http://www.egtch.com<br />
项目问题提交地址：http://www.egtch.com/minibarcms#comments<br />
联系方式<br />
QQ:514337551
Email:514337551@qq.com 或 king6180@gmail.com
