<%-- 
    Document   : newjsp
    Created on : 2016-9-3, 13:11:14
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        try
		{
                    
			// 新建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			// 上传初始化
			su.initialize(pageContext);
			//设定上传限制
			//限制每个上传文件的最大长度。
			su.setMaxFileSize(1000000*8);
			//设定允许上传的文件（通过扩展名限制）
			su.setAllowedFilesList("jpg,gif,bmp,JPG,GIF,BMP,png,PNG");
			// 上传文件
			su.upload();
                        
                        String sGoodinfoname=su.getRequest().getParameter("Goodinfoname");
			String sAddr=su.getRequest().getParameter("Addr");
			String sIntro=su.getRequest().getParameter("Intro");
			String sCompany=su.getRequest().getParameter("Company");
			String sPrice=su.getRequest().getParameter("Price");
			String sNum=su.getRequest().getParameter("Num");
			int Num = Integer.parseInt(sNum);
			float fPrice = Float.parseFloat(sPrice);
                        
                        
                        out.println(sGoodinfoname+"<br>"+sAddr+"<br>"+sIntro+"<br>"+sCompany+"<br>"+fPrice+"<br>"+Num);
                }
        catch(Exception e)
		{
                    out.println(e);
			out.println("<p><font color=red>您上传的文件格式不对，或者上传文件太大！</font></p>");
			out.println("<input type=button name=btn3 value=返回 onClick='window.history.go(-1)'>");
			return;
		}
        
        %>
    </body>
</html>
