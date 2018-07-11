<%-- 
    Document   : index
    Created on : Jun 5, 2015, 6:50:26 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DeleteModule</title>
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
        <script>
            function validate()
                    {
	if(!validateID())
		return false;
                        return true;
            }
            function validateID()
{
	var form=document.getElementById("edit");
	var exp=/^[A-Za-z0-9]+$/;
	if(form.module_id.value.match(exp))
	{
		document.getElementById("fid_msg").innerHTML="";
		return true;
	}
	if(! form.module_id.value.match(exp))
	{
		document.getElementById("fid_msg").innerHTML="*Invalid Group ID";
		return false;
	}
}
             </script>

        <div data-role="header" data-theme="a">
            <img src="log.jpg" style="float:left;display:inline"/>
            <br>

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
            <a href="Modules.jsp" data-role="button" data-inline="true" class="ui-btn-active">Modules</a>
            <a href="Contents.jsp" data-role="button" data-inline="true">Contents</a>
            <a href="UserGP.jsp"  data-role="button" data-inline="true"> User Groups</a>
            <a href="Reports.jsp" data-role="button" data-inline="true">Reports</a>
        </div>
        <div class="pg">
            <div class="side">

                <div data-role="controlgroup" class="ad">

                    <a href="AddModule.jsp" data-role="button" data-corners="false" >Add Module</a>
                    <a href="DeleteModule.jsp" data-role="button" data-corners="false" class="ui-btn-active">Delete Module</a>
                    <a href="ModifyModule.jsp" data-role="button" data-corners="false">Modify Module</a>
                </div>
            </div>

            <div class="mainup" data-role="primary-content">
              
                <div data-role="main" class="ui-content" align="center">

                    <div data-role="main" class="ui-content" align="center" >
                        <h2>Enter Module Id To Delete</h2></div><center>
                        <form id="edit" name="groupdelete" method="post" action="deletemodule" data-ajax="false" onsubmit="return validate()">
        
        <div data-role="fieldcontainer" id="un"><br><br><br>
        <input type="text" name="module_id" id="gid" placeholder="Module ID" data-clear-btn="true" data-inline="true" onblur="validateID()"><span id=fid_msg style="color:red" ></span><br>
        </div>
               <br>
      <input type="submit" value="DELETE MODULE" data-inline="true"/>
    </form>
</center>
                </div></div></div>
    </body>
</html>

