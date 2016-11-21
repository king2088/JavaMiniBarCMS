<%-- 
    Document   : new_article1
    Created on : 2016-7-7, 10:37:18
    Author     : Mr.tao
--%>

<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<div class="hot_click right">
        <h3><i class="fa fa-paw"></i>ÈÈÃÅµã»÷</h3>
        <ul>
            <%
                String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
                ResultSet rs = Article.show_hot_articles();
                while(rs.next()){
                        out.print("<li><a href=\""+basePath+"show_news.jsp?articleid="+rs.getString("articleid")+"\">"+rs.getString("title")+"</a></li>");
                }
                rs.close();
            %>
        </ul>
</div>
