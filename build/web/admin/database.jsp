<%@ page language="java" %>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<style type="text/css">
body{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px; background-color: #FFC}
.input1{width:100px; height:25px; background-color: #09F; color:#FFF ; border:1px}
.font1{color:#F00; font-size:12px}
</style>
<jsp:useBean id="Mysql" class="com.bar.safe.Mysql" scope="page"></jsp:useBean>

<table width="960" height="109" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="76" colspan="2" align="center" class="font1">
	
	<%
String Ux = request.getParameter("u");

if(Ux != null)
{
	Mysql.backup();
	out.print("数据库备份成功，已备份到了C:/bar.sql");
}

	
	%>
	
	
	<%
String Bx = request.getParameter("b");
if(Bx != null){
	Mysql.load();
	out.print("数据库恢复成功");
	}
%></td>
  </tr>
  <tr>
    <td align="center"><form action="database.jsp" method="post" name="from1">
      <input type="hidden" name="u" value="Yes" />
      <input name="submit2" type="submit" class="input1" value="备份数据库" />
    </form></td>
    <td align="center"><form action="database.jsp" method="post" name="from2">
      <input type="hidden" name="b" value="Yes" />
      <input name="submit" type="submit" class="input1" value="恢复数据库" />
    </form></td>
  </tr>
</table>
