package com.bar.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.servlet.http.Cookie;

/**
 * @author  Mr.tao
 * @date    2016-7-6 21:30:31
 * @version V2.0
 * @desc  
 */
public class LoginOut extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        HttpSession session = request.getSession();
        session.invalidate();
        /*Java移除cookie的方法，使用这种方法即可使用response.sendRedirect重定向
        Cookie killMNBUser = new Cookie("MNBUser", null);
        killMNBUser.setMaxAge(0);
        killMNBUser.setPath("/");
        response.addCookie(killMNBUser); 
        Cookie killMZ = new Cookie("__MNB_mz", null);
        killMZ.setMaxAge(0);
        killMZ.setPath("/");
        response.addCookie(killMZ); 
        Cookie killMM = new Cookie("__MNB", null);
        killMM.setMaxAge(0);
        killMM.setPath("/");
        response.addCookie(killMM); 
        */
        /*JQ移除浏览器cookie，使用这种方法，无法使用response.sendRedirect重定向*/
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>安全退出</title>");
        out.println("<script src=\""+basePath+"js/jQuery1.12.4.js\" type=\"text/javascript\"></script>");
        out.println("<script src=\""+basePath+"js/jquery.cookie.js\" type=\"text/javascript\"></script>");
        out.println("</head>");
        out.println("<body>");
        out.println("<script>");
        out.println("$.cookie('MNBUser', 'false', { expire: -1 });");
        out.println("$.cookie('__MNB_mz', '', { expires: -1 });");
        out.println("$.cookie('__MNB', '', { expires: -1 });");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
        
	//response.sendRedirect(basePath+"index.jsp");//此语句不允许页面中存在HTML代码，有HTML代码则不执行，仅执行Java代码，因此这里不能使用response.sendRedirect，可以直接使用JavaScript语句<script>window.location.href=''index.jsp''</script>实现，也可以直接使用下面的语句实现
        response.setHeader("refresh","0;url="+basePath+"index.jsp");
        
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
