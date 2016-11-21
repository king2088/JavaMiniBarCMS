<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title></title>
        <style type="text/css">
		body{font-family:Georgia, "Times New Roman", Times, serif;font-size:12px; margin:0 auto}
		</style>
	</head>
	<body>
	<div align="center">
	<br><br>
	<table width="100%" border="0">
	<tr bgcolor="#F5F5F5">
    <th width="30%" align="center" height="30">文章类型ID</th>
	<th width="30%" align="center" height="30">文章类型</th>
	<th width="30%" align="center" height="30">文章数量</th>
	</tr>
	<%
		//获得所有讨论区信息
		ResultSet rs = Type.show_all();
		while(rs.next())
		{
			//显示各讨论区的详细信息
			Article.setTypeid(rs.getLong("typeid"));
	%>
			<tr>
            <td width="30%" align="center" height="25">
            <%=rs.getLong("typeid")%>
            </td>
			<td width="30%" align="center" height="25">
			<a href='article_list.jsp?typeid=<%=rs.getLong("typeid")%>' target="_self"><font color="#0000FF">	<%=rs.getString("typename")%></font></a></td>
			<td width="30%" align="center" height="25"><font color="#FF0000"><%=Article.articles_count()%></font></td>
			</tr>
	<%
		}
	%>	
	</table>
    <table width="100%" border="0">
	<tr bgcolor="#F5F5F5">
	<td width="100%" align="center" height="30">请根据文章的类型点击进行查看和修改文章。</td>
    </tr>
    </table>
	</div>
	</body>
</html>
