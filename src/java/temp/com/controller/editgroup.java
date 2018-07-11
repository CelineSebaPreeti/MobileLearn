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
@WebServlet(name = "editgroup", urlPatterns = {"/editgroup"})
public class editgroup extends HttpServlet {

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
        String id=request.getParameter("group_id");
        String name=request.getParameter("group_name");
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
          
        try
        {
            String DRIVER="com.mysql.jdbc.Driver";
  String DB_URL="jdbc:mysql://localhost:3306/mlearndb";
  String USER="root";
  String PASSWORD="sivaganesh";
  Connection con=null;
            
  Statement st;
  ResultSet rs;
             Class.forName(DRIVER);
       con=DriverManager.getConnection(DB_URL,USER,PASSWORD);
         st=con.createStatement();
        int i=st.executeUpdate("update UserGroup set group_name='"+name+"' where group_id='"+id+"'");
             
                    RequestDispatcher rd=request.getRequestDispatcher("/edited.jsp");
                    rd.forward(request, response);
        }
        catch(Exception ex)
        {
            
        }
        
       /*out.print("<html>\n"
                + "<head>\n"
                + "<title>Home</title>\n"
                + "</head>\n"
                + "<body>\n"
                + "<h1>Welcome \t"+name+"</h1>\n"
                + "</body>\n"
                + "</html>"
                    );*/
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
