package com.bar.servlet;

import com.bar.db.User;
import com.bar.safe.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author  Mr.tao
 * @date    2016-7-4 15:31:26
 * @version V2.0
 * @desc  
 */
public class ModifyPassword extends HttpServlet {
   
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
        
        MD5 oMD5 = new MD5();
        User User=new User(); //设置User为User
	HttpSession session = request.getSession();
        
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        
        //获取session中保存的UserName
	String sUserName = (String) session.getAttribute("uname");
	User.setUname(sUserName);
	//获取session中保存的UserID
	long lUserID = (Long) session.getAttribute("userid");	
	User.setUserid(lUserID);
	
	//获取所填写的旧密码
	String sOldUserPassword = oMD5.getMD5ofStr(request.getParameter("OldUserPassword"));

	User.setPwd(sOldUserPassword);
	//判断用户填写的旧密码是否正确
	if(User.valid())
	{
            //修改用户密码
            String sPwd = request.getParameter("pwd");
            String sUserPassword = oMD5.getMD5ofStr(sPwd);

	    User.setSpwd(sPwd);
                
            User.setPwd(sUserPassword);
		
            if(User.modify_UserPassword()){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>修改成功_MiniBarCMS</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_suc\">");
                out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                out.println("修改用户密码成功");
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
		else
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
                    out.println("<title>修改用户密码失败，请稍后重试_MiniBarCMS</title>");  
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id=\"tips_error\">");
                    out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                    out.println("修改用户密码失败，请稍后重试");
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
	else
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
            out.println("<title>您输入的旧密码错误_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("您输入的旧密码错误<br>");
            out.println("<a href=\""+basePath+"get_password_form.jsp\" target=\"_blank\">找回密码</a>");
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
