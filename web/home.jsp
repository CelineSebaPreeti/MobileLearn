<%-- 
    Document   : home
    Created on : Jun 6, 2015, 12:15:32 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <!--<meta http-equiv="refresh" content="10">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
  <!-- Include the jQuery library -->
  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- Include the jQuery Mobile library -->
  <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    </head>
    <body>
       <div data-role="page">
           <div data-role="header">
                           <br> <div align="center"><h1><b>
                   <% 
                      String name=(String)request.getAttribute("name");
                      // String n="ppp";
                       %>
                       Welcome <%=name%>
                       </b></h1></div>
               <br>
           </div>
  <div data-role="main" class="ui-content">
    
  </div>
</div>
    </body>
</html>
