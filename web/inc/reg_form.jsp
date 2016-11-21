<%-- 
    Document   : reg1
    Created on : 2016-7-7, 16:05:38
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
    request.setCharacterEncoding("gb2312");
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<div id="reg">
    <form action="<%=basePath%>Join.Tao" id="Join">
        <label>用户名：</label><input name="uname" id="uname" type="text" placeholder="可以使用汉字与字母"><label id="AjaxUname" class="scu"></label><br>
                <label>密码：</label><input name="pwd1" id="pwd1" type="password" placeholder="6-20位的字母和数字组成" minlength="6" required><br>
                <label>确认密码：</label><input name="pwd2" id="pwd2" type="password" required><br>
                <label>真实姓名：</label><input name="name" id="name" class="true_name" type="text" placeholder="真实信息不被透露" minlength="2" required><br>
                <div class="sex">
                <label>性别：</label><input id="sex" name="sex" type="radio" value="男" checked>男<input id="sex" name="sex" type="radio" value="女">女<input id="sex" name="sex" type="radio" value="保密">保密<br>
                </div>
                <label>出生日期：</label><input name="birth" id="birth" class="birth_day" type="text" placeholder="1980-07-17" maxlength="10" required><br>
                <label>地址：</label><input name="address" id="address" type="text" minlength="10" required><br>
                <label>邮编：</label><input name="post" id="post" class="post_code" type="text" minlength="6" required><br>
                <label>手机号码：</label><input name="tel" id="tel" type="text" placeholder="必须为11位手机号码" minlength="11" maxlength="11" required><br>
                <label>Email：</label><input name="email" id="email" type="text" placeholder="Email格式为xxx@xx.com" required><br>
                <label>密保问题：</label><input name="safequestion" id="safaquestion" type="text" placeholder="自定义密保问题"><br>
                <label>密保答案：</label><input name="safeanswer" id="safeanswer" type="text"><br>
                <label>验证码：</label><input name="Rand" id="Rand" class="val_code" type="text"><img src="<%=basePath%>Code.do" name="Image_code" id="Image_code" onClick="document.getElementById('Image_code').src='<%=basePath%>Code.do?temp='+ (new Date().getTime().toString(36)); return false" alt="点击图片刷新验证码"><label id="AjaxCode" class="scu"></label><br>
                <label></label><input id="reg_submit" type="submit" value="提交">
            </form>
        </div>
