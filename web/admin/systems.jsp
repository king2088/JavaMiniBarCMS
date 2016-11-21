<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<jsp:useBean scope="page" id="Systems" class="com.bar.db.Systems" />

<style type="text/css">
body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif ; font-size:12px; background-color:#CCC}
.input1{width:80px; border:1px #999 dashed; background-color:#333; color:#FFF; height:20px;}
.input2 {width:400px; height:20px;}
</style>
</head>

<%
 long sid=1;
 Systems.setSid(sid);
 Systems.init();
%>

<body>
<form action="updata_systems.jsp" method="post" name="from1">
<input name="sid" type="hidden" class="input2" value="1" />
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" colspan="2" align="center"><p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>网站参数设置</p>
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td width="318" height="31" align="right">网&nbsp;站&nbsp;名&nbsp;称：</td>
    <td width="642">&nbsp;&nbsp;<input name="sitename" type="text" class="input2" value="<%=Systems.getSitename()%>" /></td>
  </tr>
  <tr>
    <td height="34" align="right">关键字设置：</td>
    <td width="642">&nbsp;&nbsp;
      <input name="keywords" type="text" class="input2" value="<%=Systems.getKeywords()%>" /></td>
  </tr>
  <tr>
    <td height="24" align="right">网&nbsp;站&nbsp;描&nbsp;述&nbsp;：</td>
    <td width="642">&nbsp;&nbsp;<input name="description" type="text" class="input2" value="<%=Systems.getDescription()%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right">网站负债人：</td>
    <td width="642">&nbsp;&nbsp;<input name="author" type="text" class="input2" value="<%=Systems.getAuthor()%>" /></td>
  </tr>
  <tr>
    <td height="33" align="right">网站E-mail：</td>
    <td>&nbsp;&nbsp;<input name="email" type="text" class="input2" value="<%=Systems.getEmail()%>" /></td>
  </tr>
  <tr>
    <td height="38" align="right">联&nbsp;系&nbsp;电&nbsp;话&nbsp;：</td>
    <td>&nbsp;&nbsp;<input name="tel" type="text" class="input2" value="<%=Systems.getTel()%>" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;&nbsp;<input name="sub" type="submit" class="input1" value="提交" />      &nbsp;&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>