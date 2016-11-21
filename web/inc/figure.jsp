<%-- 
    Document   : figure
    Created on : 2016-7-11, 21:45:24
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<figure class="right">
    <img src="<%=basePath%>images/112.jpg">
    <div class="title"><i class="fa fa-retweet" aria-hidden="true"></i>
        巴黎5日游</div>
    <span>如图所示就是第一次打开的计算器的样子。默认第一次打开的功能是标准，我们在这里可以做做简单的加减乘除的计算。另外，根号的使用要先输入数字再点击根号，1/x即倒数的使用也要先输入数字再点击1/x倒数功能。</span>
</figure>
