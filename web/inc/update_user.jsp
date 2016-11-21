<%-- 
    Document   : update_user.jsp
    Created on : 2016-7-30, 21:31:40
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<%
	//获取session中保存的UserName属性值
	String suname = (String) session.getAttribute("uname");
	//获取session中保存的UserID
	long userid = (Long) session.getAttribute("userid");	
	User.setUserid(userid);	
	//初始化用户信息
	User.init();
	float sMoney = User.getMoney();
%>
<h3>修改密码</h3>
<div class="pwdm">
    <form name="form_psw" id="PWD" method="post" action="<%=basePath%>Password" target="_self">
        <label>请输入旧密码：</label><input name="OldUserPassword" type="password" size="20"><br>
        <label>请输入新密码：</label><input name="pwd" type="password" id="pwd" size="20" ><br>
        <label>请确认新密码：</label><input name="pwd1" type="password" id="pwd1" size="20" ><br>
        <input type="submit" name="submit_psw" value="修改">
        <input type="reset" name="res" value="取消"><br>
        <div id="pwd_error"></div>
    </form>
</div>
<div class="user_info">
    <h3>修改其他信息</h3>
        <form name="form_user_info" id="Info_u" method="post" action="<%=basePath%>ModifyUser" >
            <label>名称：</label><%=suname%><br>
            <label>余额：</label><input name="money" type="text" id="money" value="<%=sMoney%>" size="20">(<a href="https://www.alipay.com" target="_parent">支付宝转账</a>&nbsp;|&nbsp;<a href="https://ibsbjstar.ccb.com.cn/app/V5/CN/STY1/login.jsp" target="_blank">建行网银</a>)<br>
            <label>姓名：</label><input name="name" type="text" id="name" value="<%=User.getName()%>" size="20"><br>
            <label>性别：</label><%=User.getSex()%> <input type="radio" name="sex" value="男" <%if(User.getSex().compareTo("男") == 0)  out.println("checked");%> >男 <input type="radio" name="sex" value="女" <%if(User.getSex().compareTo("女") == 0)  out.println("checked");%> >女 <input type="radio" name="sex" value="保密" <%if(User.getSex().compareTo("保密") == 0)  out.println("checked");%>>保密<br>
            <label>生日：</label><input name="birth" type="text" id="birth" value="<%=User.getBirth()%>" size="20">(日期格式必须为0000-00-00)<br>
            <label>邮编：</label><input name="post" type="text" id="post" value="<%=User.getPost()%>" size="50"><br>
            <label>住址：</label>
            <input name="address" type="text" id="address" value="<%=User.getAddress()%>" size="50" maxlength="400"><br>
            <label>Email：</label><input name="email" type="text" size="50" value="<%=User.getEmail()%>"><br>
            <label>电话：</label><input name="tel" type="text" id="tel" value="<%=User.getTel()%>" size="20"><br>
            <label>安全问题：</label><input name="safequestion" type="text" id="safequestion" value="<%=User.getSafequestion()%>" size="50"><br>
            <label>安全答案：</label><input name="safeanswer" type="text" id="safeanswer" value="<%=User.getSafeanswer()%>" size="50"><br>

            <input type="submit" name="submit_u_info" value="修改">
            <input type="reset" name="res" value="取消">
        </form>
</div>