<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
		<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
         <style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		td{border-right:1px #999 dashed;border-bottom:1px #999 dashed;}
		.input1{width:120px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		.input2{width:80px; height:20px; border:1px #666 dashed; color:#FFF; background-color:#333;}
		</style>
	</head>
	<%

	//获取所有员工信息
	ResultSet rs = User.show_member_users();
	//初始化分页显示类
	pages.initialize(rs,25);
	String strPage=null;
	int showPage = 1;
	//获取跳转到的目的页面
	strPage=request.getParameter("showPage");
	if (strPage==null)
	{
		showPage=1;
	}
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
		{
			showPage=1;
		}
		if(showPage>pages.getPageCount()) 
		{
			showPage=pages.getPageCount();
		}
	}	
	//获取要显示的数据集合
	Vector vData=pages.getPage(showPage);	
%>
	<body bgcolor="#F2F2F2">
		<div align="center">
		<form name="form1" method="post" action="delete_member.jsp" target="_self">
		<input type="hidden" name="showPage" value="<%=showPage%>">
	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" >
			<tr bgcolor="#CC99FF">
			<th width="2%" height="30" align="center">选中</th>
			<th width="3%" height="30" align="center">会员号</th>
			<th width="8%" align="center">用户名</th>
			<th width="4%" height="30" align="center">姓名</th>
			<th width="3%" align="center">性别</th>
			<th width="15%" height="30" colspan="2" align="center">联系方式</th>
			<th width="7%" height="30" align="center">联系地址</th>
			<th width="8%" align="center">账户余额</th>
			</tr>
		<%			
			//循环显示当前页的员工信息
			for(int i=0;i<vData.size();i++)
			{ 
				//显示数据
				String[] sData=(String[])vData.get(i);
		%>
				<tr>
					<td width="2%" height="25" align="center">&nbsp;<input type="checkbox" name="DeleteID" value="<%=sData[0]%>"></td>
					<td width="3%" height="25" align="center"><%=sData[0]%></td>
				  <td width="8%" height="25" align="center"><%=sData[2]%></td>
			    <td width="4%" height="25" align="center"><font color="#0000FF"><%=sData[3]%></font></td>
			    <td width="3%" height="25" align="center"><%=sData[1]%></td>
			    <td width="7%" height="25" align="center">&nbsp;tel:<%=sData[6]%></td>
		      <td width="8%" align="center">E-mail:<%=sData[5]%></td>
					<td width="7%" height="25" align="center">&nbsp;
					<%=sData[4]%>
					</td>
					<td width="8%" height="25" align="center"><%=sData[7]%>元</td>
				</tr>
		<%
				
			}
		%>
		</table>
		<p><input name="sub" type="submit" class="input1" value="删除选中的会员">
		</p>
		</form>
		<p>
		<form action="show_member_users.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页&nbsp;
			<a href="show_member_users.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a href="show_member_users.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
  <%
				}
				else
				{
					out.println("[上一页]&nbsp;");
				}
				//判断"下一页"链接是否要显示
				if(showPage < pages.getPageCount())
				{				
			%>
					<a href="show_member_users.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
		  <%
				}
				else
				{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="show_member_users.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
			转到
		  <select name="showPage">
			<%
				for(int x=1;x<=pages.getPageCount();x++)
				{
			%>
					<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
			<%
				}
			%>
			</select>
			页&nbsp;
			<input name="go" type="submit" class="input2" value="提交"/>
		</form>
		</p>
		<%rs.close();%>
	</div>
	</body>
</html>
