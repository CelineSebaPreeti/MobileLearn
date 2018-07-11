<%-- 
    Document   : adhome
    Created on : Jun 8, 2015, 5:25:53 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Home</title>
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
          left: 1200px;
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
  </style>
    </head>
    <body>
       <div data-role="page">
           <div data-role="header" data-theme="a">
                 <img src="spi.jpg" style="float:left;display:inline"/>
               
               <br> <div align="left" style="font-weight:500;" ><h1><b>
                   <% 
                      String name=(String)request.getAttribute("name");
                      // String n="ppp";
                       %>
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
          <h1 id="hd">
              Welcome <%=name%>!!!!
          </h1>
          <br>
          <%@page  import="java.sql.*" %>
          <%
          
          
                 Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb","root","sivaganesh");
        Statement stmt=con.createStatement();
        String sql="select count(*) from Reg_req;";
        ResultSet rs1=stmt.executeQuery(sql);
        rs1.next();
        int ct=rs1.getInt(1);
        String count=Integer.toString(ct);
        session.setAttribute("count",count);
         stmt.close();
         con.close();
          %>
          <h1 id="hd"> You have <%=count%> new registration requests. Click button to view requests</h1>
          <form method="post" action="Request.jsp" data-ajax="false">
              <input type="submit" value="View Requests" data-inline="true"/>
          </form>
      </div>
  </div>
</div>
    </body>
</html>