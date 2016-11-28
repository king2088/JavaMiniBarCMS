<%-- 
    Document   : testdir主要是为了测试在glassfish下Thread.currentThread().getContextClassLoader().getResource("").toString();所获得的classes目录位置，以便存放DB.properties文件到相应目录，在java类中所测试的目录为当前web目录下的classes文件，但是在sevelet中测试则变为了glassfish的classes目录
    Created on : 2016-8-24, 15:51:35
    Author     : Mr.Tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="DB" class="com.bar.db.ExecuteDB" />
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
<%
 String path1 = Thread.currentThread().getContextClassLoader().getResource("").toString();
 path1=path1.replace('/', '\\'); // 将/换成\  
 path1=path1.replace("file:", ""); //去掉file:  
 path1=path1.replace("classes\\", ""); //去掉class\  
 path1=path1.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
 out.println("Thread:"+path1);
%>
    </body>
    
</html>
