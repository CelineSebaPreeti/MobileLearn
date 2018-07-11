<%-- 
    Document   : Request
    Created on : Jun 10, 2015, 2:43:12 PM
    Author     : lenovo
--%>

<%@page import="temp.com.model.Contents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Modules</title>
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
            }    </style>
    </head>
    <body>
        <div data-role="page">
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
                    if(form.group_id.value.match(exp))
                    {
                        document.getElementById("fid_msg").innerHTML="";
                        return true;
                    }
                    if(! form.group_id.value.match(exp))
                    {
                        document.getElementById("fid_msg").innerHTML="*Invalid Group name";
                        return false;
                    }
                    function check()
                    {
                        if(document.getElementById('ch1').checked)
                        {
                            return true;
                        }
                        else
                        {
                            document.getElementById("fid_msg").innerHTML="*SELECT A MODULE TO DELETE FROM GRP";

                            return false;
                        }
                    }
                }
            </script>
            <div data-role="header" data-theme="a">
                <img src="log.jpg" style="float:left;display:inline"/>
                <br> <div align="left" style="font-weight:500;" ><h1><b>

                            <br/><br/>
                        </b></h1></div>
                <div class="b" data-role="controlgroup" data-type="horizontal">
                    <!-- <a href="/mlearn/adhome.jsp" data-role="button" data-icon="home" data-inline="true">Home</a>-->
                    <a href="/mlearn/adlogout.jsp" data-role="button" data-icon="delete" data-inline="true">Logout</a>
                </div>
            </div>
            <div data-role="main" class="ui-content">
                <div data-role="controlgroup" class="nav">

                    <!-- <a href="#" class="ui-btn-active" data-role="button" data-inline="true">Home</a>-->
                    <a href="adhome.jsp"  data-role="button" data-inline="true">Registration Requests</a>
                    <a href="Users.jsp" data-role="button" data-inline="true">Users</a>
                    <a href="Modules.jsp" data-role="button" data-inline="true" class="ui-btn-active">Modules</a>
                    <a href="Contents.jsp" data-role="button" data-inline="true">Contents</a>
                    <a href="UserGP.jsp" data-role="button" data-inline="true"> User Groups</a>
                    <a href="Reports.jsp" data-role="button" data-inline="true">Reports</a>
                </div>
                <div class="pg">
                    <div class="side">

                        <div data-role="controlgroup" class="ad">
                       <a href="AddContent.jsp" data-role="button" data-corners="false" >Add Content</a>
                       <a href="DelContent.jsp" data-role="button" data-corners="false">Delete Content</a>
                       <a href="AddModGrp.jsp" data-role="button" data-corners="false" >Add Module To Group</a>
                       <a href="RemoveModGrp.jsp" data-role="button" data-corners="false" class="ui-btn-active">Remove Module From Group</a>

                        </div>
                    </div>

                    <div class="mainup" data-role="primary-content">

                        <div data-role="main" class="ui-content" align="center">

                            <div data-role="main" class="ui-content" align="center" >

                                <h2>Select the module to delete from group</h2></div>
                            <form id="edit" name="groupadd" method="post" action="delmodfrmgrp" data-ajax="false" onsubmit="return validate()">
                                <table class="t" border="5" cellpadding="2" cellspacing="2" align="center">
                                    <tr>
                                        <th>Module ID</th>
                                        <th>Group ID</th>
                                        <th>Select</th>
                                    </tr>

                                    <%@page import="java.sql.*" %>
                                    <%


                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con;
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlearndb", "root", "sivaganesh");
                                        int i;
                                        Contents[] rb;
                                        Statement stmt = con.createStatement();
                                        Statement stmt1 = con.createStatement();
                                        String sql = "select module_id,group_id from Module_grp_mapping";
                                        ResultSet rs = stmt.executeQuery(sql);

                                        String sql2 = "select count(module_id) FROM Module_grp_mapping ";
                                        ResultSet rs1 = stmt1.executeQuery(sql2);
                                        rs1.next();
                                        int ct = rs1.getInt(1);
                                        String count = Integer.toString(ct);
                                        session.setAttribute("num6", count);
                                        stmt1.close();
                                        i = 0;
                                        rb = new Contents[ct];
                                        while (rs.next()) {
                                            rb[i] = new Contents();
                                            rb[i].setModid(rs.getString(1));
                                            rb[i].setGroupid(rs.getString(2));
                                    %>
                                    <tr>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><input id="ch1" type="checkbox" name="ap6" value="<%=rs.getString(1)%>" onsubmit="return check()"/></td>
                                    </tr>
                                    <%
                                            i++;

                                        }
                                        session.setAttribute("rb6", rb);
                                        stmt.close();
                                        con.close();
                                    %>

                                </table><br/><br/>
                                <input type="submit" value="Delete" data-inline="true" class="s"/>
                            </form>



                        </div>
                    </div>
                </div>
                </body>
                </html>
