<%-- 
    Document   : Request
    Created on : Jun 10, 2015, 2:43:12 PM
    Author     : lenovo
--%>

<%@page import="temp.com.model.ReqBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Requests</title>
       <meta charset="UTF-8">
        <!--<meta http-equiv="refresh" content="10">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Bowrum2.min.css" />
<link rel="stylesheet" href="jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  
<style>
      .b
      {
          position: absolute;
          top:50px;
          left: 1300px;
      }
      
     .sp
     {
         position: relative;
         left:15px;
     }
     .nav
     {
         border-bottom: gainsboro 2px solid;
     }
     .pg
     {
         position: relative;
         top:5px;
         right:3px;
         height:700px;
         width: 1300px;
         border-top: gainsboro 2px solid;
         border-left: gainsboro 2px solid;
         border-right: gainsboro 2px solid;
     }
    #hd
     {
         position: relative;
         left:30px;
     }
     .t
     {
        position: relative;
        top:30px;
     }
     .s
     {
         position: relative;
         top:50px;
         left:500px;
     }
     </style>
    </head>
    <body>
        <div data-role="page">
           <div data-role="header" data-theme="a">
                <img src="spi.jpg" style="float:left;display:inline"/>
               
         
               <br> <div align="left" style="font-weight:500;" ><h1><b>
                  
                      <br/>
                       </b></h1></div>
               <div class="b" data-role="controlgroup" data-type="horizontal">
                  <!-- <a href="/mlearn/adhome.jsp" data-role="button" data-icon="home" data-inline="true">Home</a>-->
                   <a href="/mlearn/adlogout.jsp" data-role="button" data-icon="delete" data-inline="true">Logout</a>
               </div>
           </div>
  <div data-role="main" class="ui-content">
      <div data-role="controlgroup" class="nav">
    
       <!-- <a href="#" class="ui-btn-active" data-role="button" data-inline="true">Home</a>-->
        <a href="adhome.jsp" class="ui-btn-active" data-role="button" data-inline="true">Registration Requests</a>
        <a href="Users.jsp" data-role="button" data-inline="true">Users</a>
        <a href="Modules.jsp" data-role="button" data-inline="true">Modules</a>
        <a href="Contents.jsp" data-role="button" data-inline="true">Contents</a>
        <a href="UserGP.jsp" data-role="button" data-inline="true"> User Groups</a>
        <a href="Reports.jsp" data-role="button" data-inline="true">Reports</a>
        </div>
      <div class="pg">
          <br>
         
          
          <h1 id="hd">New Requests. Check in the box to approve the user.</h1>
          <form method="post" action="RequestConfirm" data-ajax="false">
          <table class="t" border="5" cellpadding="2" cellspacing="2" align="center">
              <tr>
                  <th>Request ID</th>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Email ID</th>
                  <th>Mobile No.</th>
                  <th>Date Of Birth</th>
                  <th>Designation</th>
                  <th>Approval</th>
              </tr>
               
              <%@page import="java.sql.*" %>
              <%
                   Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb","root","sivaganesh");
        int i;
        ReqBean[] rb;
            Statement stmt=con.createStatement();
                String sql="select * from Reg_req;";
                // int count=Integer.parseInt((String)request.getAttribute("count"));
                ResultSet rs=stmt.executeQuery(sql);
                i = 0;
               // HttpSession session=request.getSession(true);
                String ct=(String)session.getAttribute("count");
                int count=Integer.parseInt(ct);
                 rb = new ReqBean[count];
                while(rs.next())
                {
                    rb[i]=new ReqBean();
                   rb[i].setRid(rs.getInt(1)); 
                   rb[i].setName(rs.getString(2));
                    rb[i].setAddress(rs.getString(3));
                    rb[i].setEmail(rs.getString(4));
                    rb[i].setMobile(rs.getString(5));
                    rb[i].setDob(rs.getString(6));
                    rb[i].setDes(rs.getString(7));
                    %>
                    <tr>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        
                        <td><input type="checkbox" name="ap" value="<%=rs.getInt(1) %>"/></td>
                    </tr>
                    <%
                    i++;
                    
                  }
                session.setAttribute("rb",rb);
                stmt.close();
        con.close();
                  %>
                  
          </table>
          <input type="submit" value="Approve Selected Users" data-inline="true" class="s"/>
                 </form>
               
                     
          
     </div>
  </div>
</div>
    </body>
</html>
