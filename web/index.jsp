

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login</title>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
   <link rel="stylesheet" href="Bowrum2.min.css" />
<link rel="stylesheet" href="jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
			
  <style>
     put-text    
{
    width: 20% !important;

}
  </style>

    </head>
    <body>
       <div data-role="page" >
           <div data-role="header">
               <img src="log.jpg" style="float:left;display:inline"/>
               <br> <div align="center"><h1><b>LOGIN</b></h1></div>
               <br>
           </div>
  <div data-role="main" class="ui-content" align="center" >
    <form name="loginform" method="post" action="loginvalid" data-ajax="false">
        <div data-role="fieldcontainer" id="un">
        <input type="text" name="uname" id="uname" placeholder="ID" data-clear-btn="true" data-inline="true" required >
        </div>
        <div id="e1"></div>
        <br>
    
      <input type="password" name="pwd" id="pwd" placeholder="Password" data-clear-btn="true" data-inline="true" required >
      <br>
      <input type="submit" value="LOGIN" data-inline="true"/>
    </form>
      <br><br>
      <form method="post" action="Reg.jsp">
          <input type="submit" value="Request for Registration" data-inline="true"/>
      </form>
  </div>
</div>
    </body>
</html>

