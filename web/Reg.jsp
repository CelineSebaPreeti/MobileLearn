<%-- 
    Document   : index
    Created on : Jun 5, 2015, 6:50:26 PM
    Author     : lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

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
      .ui-input-text    
{
    width: 20% !important;
}
  </style>
    </head>
    <body>
              
<div data-role="page">
           
<div data-role="header">
              <img src="log.jpg" style="float:left;display:inline"/>
 <br> <div align="center"><h1><b>REGISTER</b></h1></div>
               
<br>
          
 </div>
  
<div data-role="main" class="ui-content" align="center">
   
 <form id="reg" method="post" action="RegUser" onsubmit="return validate()">
        
       
 <input type="text" name="uname" id="uname" placeholder="User Name" data-clear-btn="true" data-inline="true" onblur="validateName()">
<span id=fname_msg style="color:red"></span><br>
  
    
  <input type="text" name="uaddress" id="pwd" placeholder="Address" data-clear-btn="true" data-inline="true" onblur="validateAddress()"><span id=fadd_msg style="color:red"></span><br>
     
    
  <input type="text" name="uemail" id="pwd" placeholder="Email-Id" data-clear-btn="true" data-inline="true" onblur="validateEmail()">
<span id=fmail_msg style="color:red"></span><br>
      
      
<input type="text" name="umobile" id="pwd" placeholder="Mobile Number" data-clear-btn="true" data-inline="true" onblur="validateNumber()" >
<span id=fno_msg style="color:red"></span><br>
      
      
 <input type="text" name="udob" id="pwd" placeholder="Date Of Birth(yyyy-mm-dd)" data-clear-btn="true" data-inline="true" onblur="validateDOB()" ><span id=fdob_msg style="color:red"></span><br>
    
       
<input type="text" name="udesign" id="pwd" placeholder="Designation" data-clear-btn="true" data-inline="true" onblur="validatedesig()" ><span id=fdesig_msg style="color:red"></span><br>
    
     
 <input type="submit" value="REGISTER" data-inline="true"/>
 <script>
        function validate()
        {
	if(!validateName())
		return false;
           if(!validateAddress())
		return false;
             if(!validateEmail())
		return false;
             if(!validateNumber())
		return false;
            if(!validatedob())
		return false;
              if(!validatedesig())
		return false;
	return true;
}
      
function validateName()
{
	var form=document.getElementById("reg");
	var exp=/^[A-Za-z\s]+$/;
	if(form.uname.value.match(exp))
	{
		document.getElementById("fname_msg").innerHTML="";
		return true;
	}
	if(! form.uname.value.match(exp))
	{
		document.getElementById("fname_msg").innerHTML="*Invalid name";
		return false;
	}
}
     
 function validateAddress()
{
	var form=document.getElementById("reg");
	var exp=/^[A-Za-z0-9'\.\-\s\,]+$/;
	if(form.uaddress.value.match(exp))
	{
		document.getElementById("fadd_msg").innerHTML="";
		return true;
	}
	if(! form.uaddress.value.match(exp))
	{
		document.getElementById("fadd_msg").innerHTML="*Invalid Address";
		return false;
	}
}

   function validateEmail()
{ 
		var form=document.getElementById("reg");
		var exp=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		
		if(form.uemail.value.match(exp))
		{
			document.getElementById("fmail_msg").innerHTML="";
			return true;
		}
		if(! form.uemail.value.match(exp))
		{
			document.getElementById("fmail_msg").innerHTML="*Enter a valid Mail id";
			//form.email_id.focus();
			return false;
		}
  }
        
    
function validateNumber()
{ 
		var form=document.getElementById("reg");
		var exp=/^[789]\d{9}$/;
                if(form.umobile.value.match(exp))
		{
			document.getElementById("fno_msg").innerHTML="";
			return true;
		}
		if(! form.umobile.value.match(exp))
		{
			 document.getElementById("fno_msg").innerHTML="*Enter a valid Mobile Number ";
                         return false;
		}
 }
     
function validateDOB()
{ 
		var form=document.getElementById("reg");
		var exp=/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/;
		
		if(form.udob.value.match(exp))
		{
			document.getElementById("fdob_msg").innerHTML="";
			return true;
		}
		if(! form.udob.value.match(exp))
		{
			 document.getElementById("fdob_msg").innerHTML="*Enter a valid Date of Birth ";
					return false;
		}
}
         
function validatedesig()
{
	var form=document.getElementById("reg");
	var exp=/^[A-Za-z]+$/;
	if(form.udesign.value.match(exp))
	{
		document.getElementById("fdesig_msg").innerHTML="";
		return true;
	}
	if(! form.udesign.value.match(exp))
	{
		document.getElementById("fdesig_msg").innerHTML="*Invalid designation";
		return false;
	}
}

</script>
    
</form>
 
 </div>
</div>
    
</body>

</html>

