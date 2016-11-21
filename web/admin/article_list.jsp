<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		body{font-family:Georgia, "Times New Roman", Times, serif;font-size:12px; margin:0 auto}
		</style>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
		<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
		<jsp:useBean scope="page" id="Page" class="com.bar.page.SplitPage" />
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
		<%
			
			
			String stypeid = request.getParameter("typeid");
			long ltypeid = Long.parseLong(stypeid);
			
			Type.setTypeid(ltypeid);
			Type.init();
			
			Article.setTypeid(ltypeid);
			ResultSet rs = Article.show_type_articles();
			
			Page.initialize(rs,10);
			
			String strPage=null;
			int showPage = 1;
			
			strPage=request.getParameter("showPage");	
			if (strPage==null)
				showPage=1;
			else
			{
				try
				{
					showPage=Integer.parseInt(strPage);
				}
				catch(NumberFormatException e)
				{
					showPage = 1;
				}
				if(showPage<1) 
					showPage=1;
		
				if(showPage>Page.getPageCount()) 
					showPage=Page.getPageCount();
			}
			
			//获取要显示的数据集合
			Vector vData=Page.getPage(showPage);	
		%>
	</head>
	<body>
	<div align="center"><br>
	<h3><font color="#0000FF"><%=Type.getTypename()%></font></h3>
	<table width="100%" border="0" cellpadding="0" cellspacing="2">
		<tr bgcolor="#F5F5F5">
		<th width="11%" height="30" align="center">作者</th>
		<th width="19%" height="30" align="center">发布时间</th>
		<th width="31%" height="30" align="center">文章标题</th>
		<th width="13%" height="30" align="center">阅读数</th>
		<th width="13%" height="30" align="center">回复数</th>
        <th width="13%" height="30" align="center">操作</th>
		</tr>
	<%
		for(int i=0;i<vData.size();i++)
		{ 
			//循环显示文章信息
			String[] sData=(String[])vData.get(i);
			long lUserID = Long.parseLong(sData[2]);
			User.setUserid(lUserID);
			if(User.init())
			{
	%>
			<tr>
				<td height="25" align="center"><font color="#0000FF"><%=User.getUname()%></font></td> 
				<td height="25" align="center"><%=sData[5]%></td>
				<td height="25" align="left"><a href="article_show.jsp?articleid=<%=sData[0]%>&typeid=<%=stypeid%>" target="_self"><font color="#0000FF"><%="&nbsp;"+sData[1]%></font></a></td> 	
				<td height="25" align="center"><font color="#FF0000"><%=sData[3]%></font></td> 
				<td height="25" align="center"><font color="#FF0000"><%=sData[4]%></font></td> 
                <td height="25" align="center"><font color="#FF0000"><a href="article_show.jsp?articleid=<%=sData[0]%>&typeid=<%=stypeid%>">查看并编辑</a></font></td> 
			</tr> 		
	<%
			}
		}
	%>
	</table>
	<p>
	<form action="article_list.jsp" method="post" target="_self">	
		[<a href="./add_article_form.jsp?typeid=<%=ltypeid%>&ArticleID=0" target="_self"><font color="#0000FF">发表文章</font></a>]&nbsp;
		第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=Page.getPageCount()%></font>页&nbsp;
		<a href="article_list.jsp?showPage=1&typeid=<%=stypeid%>" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
		<%
			//判断"上一页"链接是否要显示
			if(showPage > 1)
			{				
		%>
				<a href="article_list.jsp?showPage=<%=showPage-1%>&typeid=<%=ltypeid%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[上一页]&nbsp;");

			//判断"下一页"链接是否要显示
			if(showPage < Page.getPageCount())
			{				
		%>
				<a href="article_list.jsp?showPage=<%=showPage+1%>&typeid=<%=ltypeid%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		<%
			}
			else
				out.println("[下一页]&nbsp;");

		%> 
		<a href="article_list.jsp?showPage=<%=Page.getPageCount()%>&typeid=<%=ltypeid%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
		转到
		<select name="showPage">
		<%
			for(int x=1;x<=Page.getPageCount();x++)
			{
		%>
				<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
		<%
			}
		%>
		</select>
		<input type="hidden" name="typeid" value="<%=ltypeid%>">页&nbsp;
		<input type="submit" name="go" value="提交"/>
	</form></p>
	<%rs.close();%>
	</div>
	</body>
</html>

