<%-- 
    Document   : index
    Created on : Jun 5, 2015, 6:50:26 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>deletedUserGroup</title>
        <meta charset="UTF-8">
        <!--<meta http-equiv="refresh" content="10">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
        <!-- Include the jQuery library -->
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
                right:1px;
                height:700px;
                width: 1320px;
                border-top: gainsboro 2px solid;
                border-left: gainsboro 2px solid;
                border-right: gainsboro 2px solid;
            }
            .side
            {
                position:relative;
                left:1px;
                top:-3px;
                height:700px;
                width:250px;
                float:left;
                border-left: gainsboro 2px solid;
                border-right: gainsboro 2px solid;
            }
            .mainup
            {
                position:relative;
                left:150px;
                top:-3px;
                height:700px;
                width:1050px;
            }
            .ad
            {
                position:relative;
                top:-5px;
            }
            #hd
            {
                position: relative;
                left:30px;
            }
            .p
            {
                position:relative;
                left:25px;
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
 
      <div data-role="controlgroup" class="nav">
    
       <!-- <a href="#" class="ui-btn-active" data-role="button" data-inline="true">Home</a>-->
        <a href="adhome.jsp"  data-role="button" data-inline="true">Registration Requests</a>
        <a href="Users.jsp" data-role="button" data-inline="true">Users</a>
        <a href="Modules.jsp" data-role="button" data-inline="true">Modules</a>
        <a href="Contents.jsp" data-role="button" data-inline="true">Contents</a>
        <a href="UserGP.jsp" class="ui-btn-active" data-role="button" data-inline="true"> User Groups</a>
        <a href="Reports.jsp" data-role="button" data-inline="true">Reports</a>
        </div>
    
    </head>
   
     <div class="pg">
            <div class="side">

                <div data-role="controlgroup" class="ad">

                    <a href="AddUserGP.jsp" data-role="button" data-corners="false">AddGroup</a>
                    <a href="DeleteUserGP.jsp" data-role="button" data-corners="false">DeleteGroup</a>
                    <a href="ModifyUserGP.jsp" data-role="button" data-corners="false">ModifyGroup</a>

                </div>
            </div>

            <div class="mainup" data-role="primary-content">
              
                <div data-role="main" class="ui-content" align="center">

                    <div data-role="main" class="ui-content" align="center" >
                        <h2> Name Changed Sucessfully!!!</h2></div>
  </div></div></div>
    </body>
</html>

