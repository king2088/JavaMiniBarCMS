<%-- 
    Document   : news1
    Created on : 2016-7-6, 20:41:59
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%@ page import="java.sql.*"%>
<div class="newslist left">
    <h2><i class="fa fa-newspaper-o" aria-hidden="true"></i>热点新闻</h2>
    <ul class="list_index">
        <%
            String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        long ltypeid = 1;
        Article.setTypeid(ltypeid);
        ResultSet rs = Article.show_anews_articles();
        while(rs.next()){
                out.print("<li><a href=\""+basePath+"show_news.jsp?articleid="+rs.getString("articleid")+"\"target=\"_blank\">"+rs.getString("title")+"</a></li>");
        }
        rs.close();
        %>
                </ul>
</div>
