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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import temp.com.model.UserGroup;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "deluser", urlPatterns = {"/deluser"})
public class deluser extends HttpServlet {
/**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String host;
	private String port;
	private String user;
	private String pass;
        
	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
       String[] approved = request.getParameterValues("ap");
       HttpSession session=request.getSession();
      int count=Integer.parseInt((String)session.getAttribute("num"));
     
       UserGroup[] rb=(UserGroup[])session.getAttribute("rb2");
       String uid,gid;
       
        String compare="yes";
      int a;
       try
       {
        
       for(int i=0;i<approved.length;i++)
       {
           for(int j=0;j<count;j++)
           {
               if((approved[i]).equals(compare))
                      {
                            
                           uid=rb[j].getUid();
                           gid=rb[j].getGid();                       
                           
                           Connection con;
                            
                    try
        {
            String DRIVER="com.mysql.jdbc.Driver";
  String DB_URL="jdbc:mysql://localhost:3306/mlearndb";
  String USER="root";
  String PASSWORD="sivaganesh";
         
  Statement st;
  ResultSet rs;
             Class.forName(DRIVER);
       con=DriverManager.getConnection(DB_URL,USER,PASSWORD);
         st=con.createStatement();
        a=st.executeUpdate("delete from User_grp_mapping where group_id='"+gid+"'");
                        RequestDispatcher rd=request.getRequestDispatcher("/deleted.jsp");
                    rd.forward(request, response);
                             con.close();
                   }
                          catch(Exception e)
                          {
                              
                          }
                           
                             
                             break;
                       }
           }
       }
     
       }
       catch(Exception e)
       {}

    }
}
