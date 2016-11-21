<%-- 
    Document   : top_news1
    Created on : 2016-7-6, 20:44:43
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="GB2312"%>
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%@ page import="java.sql.*"%>
<div class="newslist left">
                <h2><i class="fa fa-map-signs" aria-hidden="true"></i>¾Æ°É¹«¸æ</h2>
                <ul class="list_index">
    <%
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        long ltypeid = 2;
        Article.setTypeid(ltypeid);
        ResultSet rs = Article.show_news_articles();
        while(rs.next()){
                out.print("<li><a target=\"_blank\" href=\""+basePath+"show_news.jsp?articleid="+rs.getString("articleid")+"\">"+rs.getString("title")+"</a></li>");
        }
        rs.close();
    %>
                </ul>
</div>