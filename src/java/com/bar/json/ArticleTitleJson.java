package com.bar.json;

import com.bar.db.ExecuteDB;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author  Mr.Tao
 * @date    2016-9-13 16:00:36
 * @version V2.0
 * @desc  获取文章的ID与标题
 */
@WebServlet(name="ArticleTitleJson", urlPatterns={"/ArticleTitle.json"})
public class ArticleTitleJson extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/json;charset=GB2312");
        try(PrintWriter out = response.getWriter()){
            ExecuteDB DB = new ExecuteDB();
            String callback = request.getParameter("callback");
        if(callback!=null){
            String sql = "select articleid,title from articles";
            ResultSet rs = DB.exeQuery(sql);  
            JsonObject object = new JsonObject();  
            JsonArray array = new JsonArray();
            while (rs.next()) {
                JsonObject ob = new JsonObject();  
                ob.addProperty("id", rs.getInt("articleid"));  
                ob.addProperty("title", rs.getString("title"));
                array.add(ob);
            }
                object.add("ArticleTitle", array);  
                out.print(callback+"("+object.toString()+")");//使用jsonp进行访问json数据
        }else{
            out.print("你无权查看此页");
        }
    }catch(Exception ex)
		{
                    System.out.println(ex.toString());
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
