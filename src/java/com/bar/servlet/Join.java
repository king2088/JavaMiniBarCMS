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
 * @date    2016-7-7 20:43:51
 * @version V2.0
 * @desc  
 */
public class Join extends HttpServlet {
   
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
        
        HttpSession session = request.getSession();
        User User=new User();
        MD5 oMD5=new MD5();
        
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        
        request.setCharacterEncoding("gb2312");
	String sRand_1 = (String)session.getAttribute("Rand");
	String sRand_2 = request.getParameter("Rand");
	if (sRand_1.compareTo(sRand_2)==0) 
	{	
		String uname = request.getParameter("uname");
		User.setUname(uname);
		if(User.exist())
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
                    out.println("<title>用户名已经存在，请重试_MiniBarCMS</title>");  
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id=\"tips_error\">");
                    out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                    out.println("用户名"+uname+"已存在，请重新更换注册用户名");
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
                        String spwd = request.getParameter("pwd1");
			String pwd =  oMD5.getMD5ofStr(request.getParameter("pwd1"));
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String birth = request.getParameter("birth");
			String address = request.getParameter("address");
			String post = request.getParameter("post");
			String safequestion = request.getParameter("safequestion");
			String safeanswer = request.getParameter("safeanswer");
			
			User.setSpwd(spwd);
			User.setPwd(pwd);
			User.setName(name);
			User.setSex(sex);
			User.setTel(tel);
			User.setEmail(email);
			User.setBirth(birth);
			User.setAddress(address);
			User.setPost(post);
			User.setSafequestion(safequestion);
			User.setSafeanswer(safeanswer);
			User.setRole("0");
			if(User.add())
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
                            out.println("<title>用户注册成功_MiniBarCMS</title>");  
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<div id=\"tips_suc\">");
                            out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                            out.println("用户注册成功");
                            out.println("<a href=\""+basePath+"\" target=\"_self\">现在登录</a>");
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
                            out.println("<title>注册失败，请重试_MiniBarCMS</title>");  
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<div id=\"tips_error\">");
                            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                            out.println("用户注册失败，请稍后重试");
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
            out.println("<title>验证码输入错误_MiniBarCMS</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<div id=\"tips_error\">");
            out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
            out.println("您输入的验证码错误");
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
	session.removeAttribute("Rand");
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
