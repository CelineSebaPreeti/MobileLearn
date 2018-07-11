<%-- 
    Document   : error
    Created on : Jun 6, 2015, 1:42:04 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<meta http-equiv="refresh" content="10">-->
          <link rel="stylesheet" href="Bowrum2.min.css" />
<link rel="stylesheet" href="jquery.mobile.icons.min.css" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
			
  <style>
      .ui-input-text    
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
      
      <h3>Invalid  ID or password. Please try again.</h3>
    <form method="post" action="loginvalid" data-ajax="false">
        <input type="text" name="uname" id="uname" placeholder="ID" data-clear-btn="true" data-inline="true" required >
  <!--  <script>
            function uval()
      {
          var user=document.loginform.uname.value;
          //pattern for userid. Can be changed later.
          var re=new RegExp(/U(\d){9}/);
          if((user.length!==10) || (!re.test(user)))
            document.getElementById("e1").innerHTML="<b>Enter valid User ID<b>";
        else
            document.getElementById("e1").innerHTML="";
                 //alert("enter valid un");
      }
        </script>-->
        <div id="e1"></div>
        <br>
      <input type="password" name="pwd" id="pwd" placeholder="Password" data-clear-btn="true" data-inline="true">
      <br>
      <input type="submit" value="LOGIN" data-inline="true"/>
    </form>
  </div>
</div>
      
    </body>
</html>

