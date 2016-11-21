<%@ page language="java" %>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<style type="text/css">
body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color: #FFC}
.input1{width:100px; height:25px; background-color: #09F; color:#FFF ; border:1px}
.font1{color:#F00; font-size:12px}
.font2{color:#000; font-size:12px}
.font3{color:#000; font-size:14px}
.font4{color:#000; font-size:18px}
</style>
<jsp:useBean id="Mysql" class="com.bar.safe.Mysql" scope="page"></jsp:useBean>

<title>网站安装</title><table width="960" height="334" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="76" align="center" class="font2"><p><font class="font3">网站安装</font></p>
<p>1、mysql数据的用户名必须为root密码必须为123456</p>
	  <p>2、在MySQL中创建一个名为<font class="font4"><b>bar</b></font>的数据库!</p>
	  <p>3、请将网站根目录下的bar.sql文件放到C盘，再点击恢复数据即可!</p>
	  <p>4、为了确保安全，请安装完成后，删除网站根目录下的install.jsp文件!</p>
	  <p>5、网站后台登陆地址为<a href="http://localhost/bar/admin/login.jsp">http://localhost/bar/admin/login.jsp</a>或者<a href="http://localhost/admin/login.jsp">http://localhost/admin/login.jsp</a></p>
	  <p>5、后台登陆用户名和密码都为admin</p>
	  <p>
<font class="font1">
	    <%
String Bx = request.getParameter("b");
if(Bx != null){
	Mysql.load();
	out.print("数据库安装成功");
	}

%></font>
	  </p>
    <p>&nbsp; </p></td>
  </tr>
  <tr>
    <td height="49" align="center"><form action="install.jsp" method="post" name="from2">
      <input type="hidden" name="b" value="Yes" />
      <input name="submit" type="submit" class="input1" value="安装数据库" />
    </form></td>
  </tr>
  <tr>
    <td align="center" class="font2"><p>如果安装失败了，请利用根目录下的create_bar.sql进行对表的创建，主要步骤如下：</p>
      <p><font class="font1">1</font>、打开命令提示符，输入mysql&nbsp;&nbsp;&nbsp;&nbsp;<font class="font1">2</font>、输入create database bar;&nbsp;&nbsp;&nbsp;&nbsp;<font class="font1">3</font>、复制reate_bar.sql里面的所有SQL语句粘贴到命令提示符，最后按enter键即可</p>
<p>&nbsp;</p></td>
  </tr>
</table>
