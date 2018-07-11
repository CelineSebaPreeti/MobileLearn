/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "loginvalid", urlPatterns = {"/loginvalid"})
public class loginvalid extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        String name,upass,apass;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb","root","sivaganesh");
           Statement stmt = con.createStatement();
           String sql1="select uid,password,name from User where uid='"+uname+"';";
                ResultSet rs1=stmt.executeQuery(sql1);
                if(rs1.next())
                {
                    upass=rs1.getString(2);
                    if(upass.equals(pwd))
                    {
                        name=rs1.getString(3);
                        request.setAttribute("name",name);
                        // response.sendRedirect("/web/home.jsp");
                        RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");
                        rd.forward(request, response);
                        // name=rs.getString(3);
                    }
                    else
                    {
                        RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
                        rd.forward(request, response);
                    }
                
                }
                else
                {
                     String sql2="select aid,password,name from Admin where aid='"+uname+"';";
                    ResultSet rs2=stmt.executeQuery(sql2);
                    if(rs2.next())
                    {
                        apass=rs2.getString(2);
                        if(apass.equals(pwd))
                        {
                            name=rs2.getString(3);
                        request.setAttribute("name",name);
                        // response.sendRedirect("/web/home.jsp");
                        RequestDispatcher rd=request.getRequestDispatcher("/adhome.jsp");
                        rd.forward(request, response);
                        }
                        else
                    {
                        RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
                        rd.forward(request, response);
                    }
                    }
                }
          
                con.close();
         } 
        catch (Exception e) {
                  } 
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   /* @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }*/

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }*/

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   /* @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}*/
