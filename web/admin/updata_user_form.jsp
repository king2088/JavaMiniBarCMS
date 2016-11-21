<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <jsp:useBean scope="page" id="User" class="com.bar.db.User" />
	<style type="text/css">
	body{margin:0 auto; padding-top:10px; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
	.input1{width:250px; height:20px;}
	.input2{ width:80px; height:20px; border: 1px #999 dashed; background-color:#333; color:#fff}
	.input3{width:400px; height:20px;}
	</style>
	</head>
	<body bgcolor="#F2F2F2">
    
    <%
	    String strPage = request.getParameter("showPage");
		String sUserID = request.getParameter("UserID");
		long lUserID = Long.parseLong(sUserID);
		User.setUserid(lUserID);
		User.init();
		
		float Money = User.getMoney();
		
	%>
    
    
	<div align="center">
	<form name="form1" method="post" action="updata_user_save.jsp" target="_self">
    	<input type="hidden" name="UserID" value="<%=lUserID%>">
<input type="hidden" name="showPage" value="<%=strPage%>">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td height="25" colspan="4" align="center"><h1 style="color:#0F3; font-size:14px">添加新员工信息</h1>
	    <p style="color: #F00; font-size:12px">以下选项均为必填项，请认真填写，若填写错误，请删除错误信息后重新添加！</p></td>
	  </tr>
	<tr>
		<td width="13%"height="39" align="right">用&nbsp;户&nbsp;名：</td>
		<td width="30%"height="39" align="left">&nbsp;&nbsp;<%=User.getUname()%></td>
		<td width="20%"height="39" align="right">登录&nbsp;密码：</td>
		<td width="37%"height="39" align="left">&nbsp;&nbsp;<%=User.getPwd()%></td>
	</tr>
	<tr>
		<td width="13%"height="41" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
		<td width="30%"height="41" align="left">&nbsp;&nbsp;<input name="Name" type="text" class="input1" id="Name" value="<%=User.getName()%>"></td>
		<td width="20%"height="41" align="right">出生&nbsp;日期：</td>
		<td width="37%"height="41" align="left">&nbsp;&nbsp;<input name="Birth" type="text" class="input1" id="Birth" value="<%=User.getBirth()%>"></td>
	</tr>
	<tr>
		<td width="13%"height="48" align="right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
		<td width="30%"height="48" align="left">&nbsp;&nbsp;<input type="radio" value="男" name="Sex" <%if(User.getSex().equals("男")) out.println("checked");%>>男&nbsp;<input type="radio" value="女" name="Sex" <%if(User.getSex().equals("女")) out.println("checked");%>>女&nbsp;<input type="radio" value="保密" name="Sex" <%if(User.getSex().equals("保密")) out.println("checked");%>>保密</td>
		<td width="20%"height="48" align="right">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
		<td width="37%"height="48" align="left">&nbsp;&nbsp;<input name="Email" type="text" class="input1" value="<%=User.getEmail()%>"></td>
	</tr>
	<tr>
		<td width="13%"height="39" align="right">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
		<td width="30%"height="39" align="left">&nbsp;&nbsp;<input name="Tel" type="text" class="input1" id="Tel" value="<%=User.getTel()%>"></td>
		<td width="20%"height="39" align="right">每月&nbsp;工资：</td>
		<td width="37%"height="39" align="left">&nbsp;&nbsp;<input name="Money" type="text" class="input1" id="Money" value="<%=Money%>"></td>
	</tr>
	<tr>
	  <td height="48" align="right">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	  <td height="48" colspan="3" align="left">&nbsp;&nbsp;<input name="Addr" type="text" class="input3" id="Addr" value="<%=User.getAddress()%>"></td>
	  </tr>
	<tr>
	  <td height="39" colspan="4" align="center"><p>填写注意事项：</p>
	    <p>1、用户名与密码为员工登陆信息</p>
	    <p>2、姓名必须是此员工的真实姓名</p>
	    <p>如果已经确认信息正确，请点击&ldquo;添加&rdquo;按钮，否则请点击&ldquo;清除&rdquo;按钮重或者新填写</p></td>
	  </tr>

	</table>
	<p>
	<input name="sub" type="submit" class="input2" value="修改">&nbsp;&nbsp;
	<input name="res" type="reset" class="input2" value="清除">&nbsp;&nbsp;
     <input type="button" name="btn2" value="返回" onClick="window.history.go(-1)" class="input2">
	</p>
	</form>
	</div>
	</body>
</html>
