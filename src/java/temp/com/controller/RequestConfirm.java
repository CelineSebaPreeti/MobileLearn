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
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.sql.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import temp.com.model.ReqBean;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "RequestConfirm", urlPatterns = {"/RequestConfirm"})
public class RequestConfirm extends HttpServlet {
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
      int rm;
       HttpSession session=request.getSession();
       int count=Integer.parseInt((String)session.getAttribute("count"));
       ReqBean[] rb=(ReqBean[])session.getAttribute("rb");
       String name,str1,str2,uid,pwd,subject,content,resultMessage = "Request approved you will receive a mail";
       subject="Registration Confirmation";
       int r1,r2,a,b;
       Random r=new Random();
       
       try
       {
      Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb","root","sivaganesh");
       Statement stmt,stmt1;
            for (String approved1 : approved) {
                for (int j = 0; j<count; j++) {
                    if ((Integer.parseInt(approved1)) == rb[j].getRid()) {
                        
                        name=rb[j].getName();
                        //U ID Generation
                        str1=name.substring(0,3);
                        r1=10000 + r.nextInt(90000);
                        str2=Integer.toString(r1);
                        uid=str1.concat(str2);
                        //Password Generation
                        r2=10000000 + r.nextInt(90000000);
                        pwd=Integer.toString(r2);
                        //Insertion into users table
                       
                      
                        stmt=con.createStatement();
                       
                        stmt1=con.createStatement();
                       
                        
                        String sql="insert into User (uid, name, address, email_id, mobile_no, dob, designation, password) values ('"+uid+"', '"+name+"', '"+rb[j].getAddress()+"', '"+rb[j].getEmail()+"', '"+rb[j].getMobile()+"', '"+java.sql.Date.valueOf(rb[j].getDob())+"', '"+rb[j].getDes()+"', '"+pwd+"');";
                        a=stmt.executeUpdate(sql);
                        request.setAttribute("Message", resultMessage);
                        //Deletion from Reg_Req table
                        String sql1="delete from Reg_req where req_id='"+rb[j].getRid()+"';";
                        b=stmt1.executeUpdate(sql1);
                        
                        stmt.close();
                        stmt1.close();
                        
                       /* //E-mail Sending Part
                         content="Dear "+name+",\n\nYour request has been approved successfully and you are successfully registered to the System. Make use of the below ID and password to login to the system.\n\nID:"+uid+"\nPassword:"+pwd+"\n\nThank You.\n\nRegards,\nXXX.";
                        // String resultMessage = "";
                        
                        try {
                        EmailUtility.sendEmail(host, port, user, pass, rb[j].getEmail(), subject,
                        content);
                        
                        resultMessage = "The e-mails were sent successfully";
                        request.setAttribute("Message", resultMessage);
                        } catch (Exception ex) {
                        resultMessage = "There were an error: " + ex;
                        request.setAttribute("Message", resultMessage);
                        } finally {
                        
                        }*/
                        break;
                    }
                }
            }
             
                  getServletContext().getRequestDispatcher("/Approved.jsp").forward(request, response);
      
  
      
       con.close();
       }

       catch(Exception e)
       {} 

    }
}
