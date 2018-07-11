a<%-- 
    Document   : Request
    Created on : Jun 10, 2015, 2:43:12 PM
    Author     : lenovo
--%>

<%@page import="temp.com.model.User"%>
<%@page import="temp.com.model.UserGroup"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Users</title>
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
  <!-- Include the jQuery library -->
  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- Include the jQuery Mobile library -->
  <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
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
        <script>
            function check()
            {
                if(document.getElementById('ch2').checked)
{
return true;
}
else
{
document.getElementById("fid_msg").innerHTML="*SELECT A USER TO DELETE";

return false;
}
            }
            </script>
        <div data-role="page">
            <div data-role="header" data-theme="a">
               <br> <div align="left" style="font-weight:500;" ><h1><b>
                  
                       <span class="sp">  XXX M-learning</span>
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
           <div data-role="main" class="ui-content" align="center">
       <h2>Select the users you wish to delete</h2></div>
          <form id="edit" name="groupadd" method="post" action="deleteuser" data-ajax="false" onsubmit="return check()">
             <table class="t" border="5" cellpadding="2" cellspacing="2" align="center">
              <tr>
                  <th>User ID</th>
                  <th>Name</th>
                  <th>Select</th>
              </tr>
               
              <%@page import="java.sql.*" %>
              <% 
              
              
                   Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb","root","sivaganesh");
        int i;
        User[] rb;
            Statement stmt=con.createStatement();
             Statement stmt1=con.createStatement();
                String sql="select uid,name from User";
                    ResultSet rs=stmt.executeQuery(sql);
               
                 String sql2="select count(*) FROM User";
                 ResultSet rs1=stmt1.executeQuery(sql2);
                  rs1.next();
                    int ct=rs1.getInt(1);
                    String count=Integer.toString(ct);
                        session.setAttribute("numb",count);
             stmt1.close();
                                       i = 0;
                   rb = new User[ct];
                while(rs.next())
                {   
                    rb[i]=new User();
                   rb[i].setUid(rs.getString(1)); 
                
                           %>
                    <tr>
                      <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                         <td><input type="checkbox" id="ch2" name="ap2" value="yes"/></td>
                    </tr>
                    <%
                    i++;
                    
                  }
                session.setAttribute("rb3",rb);
                stmt.close();
        con.close();
                  %>
                  <span id=fid_msg style="color:red"></span>
          </table>
          <input type="submit" value="Delete Users" data-inline="true" class="s"/>
                 </form>
               
                     
          
     </div>
  </div>
</div>
    </body>
</html>
