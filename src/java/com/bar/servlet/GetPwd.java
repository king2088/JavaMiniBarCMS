package com.bar.servlet;

import com.bar.db.User;
import com.bar.db.Systems;
import com.bar.mail.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author  Mr.Tao
 * @date    2016-8-2 21:42:29
 * @version V2.0
 * @desc  
 */
public class GetPwd extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=GB2312");
        PrintWriter out = response.getWriter();
        User User = new User();
        Systems Sys = new Systems();
        request.setCharacterEncoding("gb2312");
        //获取用户名
        String sUserName = request.getParameter("UserName");
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        User.setUname(sUserName);
        //根据用户名获取用户信息
        
        if(!User.post_email())
        {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
            out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
            out.println("<!--[if lt IE 9]>");
            out.println("<script src=\""+basePath+"js/html5.js\"></script>");
            out.println("<script src=\""+basePath+"js/respond.js\"></script>");
            out.println("<![endif]-->");
            out.println("<title>用户名"+sUserName+"不存在！_MiniBarCMS</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("用户名"+sUserName+"不存在！");
            out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">返回</a><a href=\""+basePath+"\">首页</a><a href=\""+basePath+"news.jsp\">资讯</a></div>");
            out.println("</div>");
            out.println("<div id=\"tips_bg\"></div>");
            out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
            out.println("<script>");
            out.println("$(function () {");
            out.println("$('#tips_error').css({");
            out.println("top:'50%',");
            out.println("left:'50%',");
            out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
            out.println("});");
            out.println("$('#tips_bg').css({");
            out.println("width:$(window).width(),");
            out.println("height:$(document).height()");
            out.println("});");
            out.println("});");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        }
    else
        {
            try
            {
                
                //这个类主要是设置邮件
                MailSenderInfo mailInfo = new MailSenderInfo();
                mailInfo.setMailServerHost("smtp.163.com");
                mailInfo.setMailServerPort("25");
                mailInfo.setValidate(true);
                mailInfo.setUserName("javaminibar@163.com");
                mailInfo.setPassword("T808090");
                mailInfo.setFromAddress("javaminibar@163.com");
                mailInfo.setToAddress(User.getEmail());
                mailInfo.setSubject("您在"+Sys.getSitename()+"中的密码");
                mailInfo.setContent("<p><i>您在"+Sys.getSitename()+"中的用户名是："+User.getUname()+"</i></p><p><i>您在"+Sys.getSitename()+"中的密码是:<strong>"+User.getSpwd()+"</strong></i></p><p style=\"color:red\">请在记住密码后立即删除此信件，以防别人看见您的密码。</p><p>------------------------------------------------</p><p>此邮件为系统自动发送，请勿回复</p><p style=\"float:right\">"+Sys.getSitename()+"客服中心</p>");
                //这个类主要来发送邮件     
                SimpleMailSender sms = new SimpleMailSender();
                //sms.sendTextMail(mailInfo);//发送文体格式
                sms.sendHtmlMail(mailInfo); //发送html格式
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>密码发送成功_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_suc\">");
                out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                out.println("您的密码已经发送到 <i style=\"color:red;background:#F1F1F1; padding:0 2px; margin:0 10px;\">"+User.getEmail()+"</i>请注意查收");
                out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">返回</a><a href=\""+basePath+"\">首页</a><a href=\""+basePath+"news.jsp\">资讯</a></div>");
                out.println("</div>");
                out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
                out.println("<script>");
                out.println("$(function () {");
                out.println("$('#tips_suc').css({");
                out.println("top:'50%',");
                out.println("left:'50%',");
                out.println("margin:'-'+($('#tips_suc').height()/2+'px 0 0 -'+$('#tips_suc').width()/2)+'px'");
                out.println("});");
                out.println("$('#tips_bg').css({");
                out.println("width:$(window).width(),");
                out.println("height:$(document).height()");
                out.println("});");
                out.println("});");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            catch(Exception e)
            {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>密码发送失败_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_error\">");
                out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                out.println("密码发送失败，请联系网站管理员");
                out.println("<div class=\"bottom_c\"><a href=\"javascript:window.history.go(-1)\">返回</a><a href=\""+basePath+"\">首页</a><a href=\""+basePath+"news.jsp\">资讯</a></div>");
                out.println("</div>");
                out.println("<div id=\"tips_bg\"></div>");
                out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\"></script>");
                out.println("<script>");
                out.println("$(function () {");
                out.println("$('#tips_error').css({");
                out.println("top:'50%',");
                out.println("left:'50%',");
                out.println("margin:'-'+($('#tips_error').height()/2+'px 0 0 -'+$('#tips_error').width()/2)+'px'");
                out.println("});");
                out.println("$('#tips_bg').css({");
                out.println("width:$(window).width(),");
                out.println("height:$(document).height()");
                out.println("});");
                out.println("});");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
