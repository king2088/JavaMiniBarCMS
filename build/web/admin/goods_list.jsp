<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean scope="page" id="Goods" class="com.bar.db.Goods" />
<jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
<jsp:useBean scope="page" id="pages" class="com.bar.page.SplitPage" />
<style type="text/css">
body{ margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px}
td{ border-right:1px #CCC dashed; border-bottom:1px #CCC dashed;}
.font1{color:#FFF}
.input1{ width:80px; height:20px; background-color:#333; border:1px #CCC dashed; color:#FFF}
.input2{ width:120px; height:20px; background-color:#333; border:1px #CCC dashed; color:#FFF}
</style>
</head>
<%
	ResultSet rs = Goodinfo.show_goodinfo();
	pages.initialize(rs,20);
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

<body bgcolor="#F4FFFE">
<div align="center">
<form name="form1" action="delete_goodinfo.jsp" method="post" target="_self">
<table width="100%" border="0" cellpadding="0" cellspacing="1">
<tr bgcolor="#0066FF" class="font1">
<td width="7%" height="20" align="center">选中</td>
<td width="20%" height="20" align="center">套餐</td>
<td height="20" colspan="2" align="center">酒水信息</td>
<td width="10%" height="20" align="center">啤酒数量</td>
<td width="12%" align="center" bgcolor="#0066FF">价格</td>
<td width="12%" height="20" align="center">修改</td>
</tr>
<%
	for(int i=0;i<vData.size();i++)
	{ 
		//显示数据
		String[] sData=(String[])vData.get(i);
		long lGoodinfoid = Long.parseLong(sData[0]);
		Goodinfo.setGoodinfoid(lGoodinfoid);
		Goodinfo.init();
		
%>
	<tr>
		<td width="7%" height="20" align="center"><input type="checkbox" name="DeleteID" value='<%=sData[0]%>'></td>
		<td width="20%" height="20" align="center"><a href="../ware_detail.jsp?Goodinfoid=<%=sData[0]%>" target="_self"><%=sData[1]%></a></td>
		<td width="22%" height="20" align="center"> 公司：<%=sData[2]%></a></td>
		<td width="17%" align="center">公司地址：<%=sData[3]%></td>
		<td width="10%" height="20" align="center"><%=sData[5]%>/打</td>
		<td width="12%" height="20" align="center"><%=Goodinfo.getPrice()%></td>
		<td width="12%" height="20" align="center"><a href="goodinfo_updata_from.jsp?Goodinfoid=<%=sData[0]%>" target="_self"><font color="#0000FF">修改</a></td>
	</tr>
<%
		
	}
%>

</table>
<p><input name="sub" type="submit" class="input2" value="删除选中的商品">&nbsp;&nbsp;
		<input name="btn" type="button" class="input2" onClick="javascript:window.location='add_goodinfo_from.jsp'" value="添加新商品">
</form>

<p>
<form action="goods_list.jsp" method="post" target="_self">	
	第<font color="#FF0000"><%=showPage%>页/共<font color=red><%=pages.getPageCount()%>页&nbsp;
	<a href="goods_list.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</a>&nbsp;			
	<%
		//判断"上一页"链接是否要显示
		if(showPage > 1)
		{				
	%>
			<a href="goods_list.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页] </a>&nbsp;
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
			<a href="goods_list.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页] </a>&nbsp;
	<%
		}
		else
		{
			out.println("[下一页]&nbsp;");
		}
	%> 
	<a href="goods_list.jsp?showPage=<%=pages.getPageCount()%>" target="_self"><font color="#0000FF">[尾页] </a>&nbsp;
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

	<input name="go" type="submit" class="input1" value="提交"/>
</form>
</p>
<%rs.close();%>
</div>

</body>
</html>
