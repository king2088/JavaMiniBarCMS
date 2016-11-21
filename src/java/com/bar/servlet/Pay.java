package com.bar.servlet;

import com.bar.db.Goods;
import com.bar.db.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author  Mr.tao
 * @date    2016-7-13 14:48:31
 * @version V2.0
 * @desc  
 */
public class Pay extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        User User = new User(); //设置User为User
        Goods Goods = new Goods();
        HttpSession session = request.getSession();
        
        
        request.setCharacterEncoding("gb2312");
	long lUserID = (Long) session.getAttribute("userid");
	User.setUserid(lUserID);
	User.init();
	
	String sGoodinfoid = request.getParameter("Goodinfoid");
	long lGoodinfoid = Long.parseLong(sGoodinfoid);
	String sBuyNumber = request.getParameter("BuyNumber");
	int iBuyNumber = Integer.parseInt(sBuyNumber);
	String fPrice = request.getParameter("Price");
	float sPrice = Float.parseFloat(fPrice);
	
	
	//用户余额减去价格并存入用户账户中
        if(sPrice*iBuyNumber > User.getMoney()){
            out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/style.css\">");
                out.println("<link rel=\"stylesheet\" href=\""+basePath+"css/font-awesome.min.css\">");
                out.println("<!--[if lt IE 9]>");
                out.println("<script src=\""+basePath+"js/html5.js\"></script>");
                out.println("<script src=\""+basePath+"js/respond.js\"></script>");
                out.println("<![endif]-->");
                out.println("<title>账户余额不足_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_error\">");
                out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                out.println("你的账户余额不足，请及时充值");
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
        else{
            float sMoney = User.getMoney();
            float Money =sMoney-sPrice*iBuyNumber;
            float gPrice = sPrice*iBuyNumber;
            User.setMoney(Money);

            //获取购物信息
            Goods.setUserid(lUserID);
            Goods.setbuynumber(iBuyNumber);
            Goods.setGoodinfoid(lGoodinfoid);
            Goods.setPrice(gPrice);
            //保存购物信息
            if(Goods.add() & User.money())
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
                out.println("<title>订购成功_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_suc\">");
                out.println("<i class=\"fa fa-check-circle fa-3x\"></i><br>");
                out.println("订购成功，请点击查看购物历史<br>");
                out.println("<input type=button name=btn1 value=确定 onClick='javascript:window.location=\""+basePath+"goods_list.jsp\"'>");
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
                out.println("<title>订购失败_MiniBarCMS</title>");  
                out.println("</head>");
                out.println("<body>");
                out.println("<div id=\"tips_error\">");
                out.println("<i class=\"fa fa-bug fa-3x\"></i><br>");
                out.println("订购失败，请稍后重试");
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
