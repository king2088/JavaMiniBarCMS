<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
        request.setCharacterEncoding("gb2312");
	String uname = (String)session.getAttribute("uname");
        String role = (String)session.getAttribute("role");
        
%>
<%
  if(uname != null && role.equals("2")){
      uname = (String)session.getAttribute("uname");
  }
  else{ 
    /*response.sendRedirect("./login.jsp");*/
    out.println("你无权访问此页面");
  }
    

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>小型酒吧在线管理后台</title>
<style type="text/css">
body{width:960px;}
</style>
</head>
<frameset rows="90,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset rows="*" cols="160,*" framespacing="0" frameborder="no" border="0">
    <frame src="left.jsp" name="leftFrame" scrolling="No" noresize="noresize" style="border-right:1px #999 dashed;" id="leftFrame" title="leftFrame" />
    <frame src="main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
