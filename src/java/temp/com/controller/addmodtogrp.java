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

import temp.com.model.Contents;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "addmodtogrp", urlPatterns = {"/addmodtogrp"})
public class addmodtogrp extends HttpServlet {
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
       String[] approved = request.getParameterValues("ap8");
       HttpSession session=request.getSession();
      int count=Integer.parseInt((String)session.getAttribute("num8"));
     
       Contents[] rb=(Contents[])session.getAttribute("rb8");
       String cid,title,mid;
       int userview;
      
        String compare="yes";
      int a;
       try
       {
        
       for(String approved1 : approved)
       {
           for(int j=0;j<count;j++)
           {
               if((approved1).equals(rb[j].getModid()))
                      {
                            
                              mid=rb[j].getModid();
                           String gid=request.getParameter("group_id");
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
        a=st.executeUpdate("insert into Module_grp_mapping(module_id,group_id,views) values('"+mid+"', '"+gid+"',0)");
                        RequestDispatcher rd=request.getRequestDispatcher("/added.jsp");
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
