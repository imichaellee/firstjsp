<%@ page language="java" import="java.util.*, java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet " contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Simple School Database Managerment Demo</title>
        <style type="text/css">
        body{
        font-family:Microsoft YaHei;
        }
        .inputtype{
        
        margin:5px;
        right:0px;
        width:130px;
        }
        .attr{
        position:relative;
        color:#8F8F8F; 
        margin-right:5px;
        padding:0px;
        border:0px;
        
        left:0px;
        text-align:left;
        }
        .center{
        position:relative;
        margin-top:10px;
        left:80px;
        }
        .superheader{
        position:relative;
        margin-bottom:20px; 
        padding-bottom:10px;
        border-bottom:1px solid #000000;
        width:100%;
        text-align:center;
        font-family:Microsoft YaHei;
        font-size:40px;
        font-weight:bold;
        }        
        .header{
        position:relative; 
        margin-top:10px; 
        padding-bottom:5px;
        border-bottom:5px solid #E3E3E3;
        width:100%;
        color:#9F9F9F;
        text-align:center;
        font-family:Microsoft YaHei;
        font-size:30px;
        font-weight:bold;
        }
        </style>
        <body>
<!--
            <div style="margin:5px;padding:10px;border:5px solid #8F8F8F">
            
                <form id="InputForLogin" action="action.jsp" method="POST">
                     <br>ID&nbsp&nbsp&nbsp: <input type="text" name="dbs_id"/>
                     <br>Password: <input type="text" name="dbs_pw" />
                     <br>
                <input type="submit" value="Login" />
                     <select name="LoginOption">
                        <option value="yeslogin">yeslogin</option>
                     </select>                 
                </form>
             </div>   
             
 -->            
            <div style="margin:5px;padding:10px;border:5px solid #8F8F8F;width:500px;">
                <form id="InputForDSAction" action="action.jsp" method="post">
                    <div class="superheader">DBS Management Demo</div>
                	<div class="header">Database Login</div>
                     <div class="center"><div style="position:relative;width:270px;text-align:right;">
                     <a class="attr">DBS ID :</a><input type="text" name="dbs_id" class="inputtype"/>
                     <br><a class="attr">Password :</a><input type="text" name="dbs_pw" class="inputtype"/>
                     <br></div></div>
                     
                     <div class="header">Controller</div>                                   
                     <div class="center"><div style="position:relative;width:270px;text-align:right;">
                     <a class="attr" id="attr1">ID :</a> <input type="text" name="id" maxlength=5 class="inputtype"/>
                     <br><a class="attr" id="attr2">NAME :</a> <input type="text" name="name" maxlength=10 class="inputtype"/>
                     <br><a class="attr" id="attr3">GRADE :</a> <input type="text" name="grade" maxlength=5 class="inputtype"/>
                     <br><a class="attr" id="attr4">SCORE :</a> <input type="text" name="score" maxlength=20 class="inputtype"/>
                     <br>
                     <div style="position:relative;width:150px;left:90px;margin-top:10px;">
                     <select name="ActionOption">
                        <option value="create">Create</option>
                        <option value="delete">Delete</option>
                        <option value="update">Update</option>
                        <option value="search">Search</option>
                     </select>
                     <select id="whattable" name="TableOption" onchange="changetable()">
                        <option value="student">Student</option>
                        <option value="teacher">Teacher</option>
                     </select>
                     </div>                     
					 	<input type="submit" value="DO" style="position:relative;width:90px;right:55px;margin-top:10px;"/>
					 	<br>
					 </div></div>
                </form>
                
            </div>
            
            
            <div id="Result">
                
            </div>            
        </body>
        <script type="text/javascript">var changetable = function()
        {
        	var obj = document.getElementById("whattable");
        	var att
        	//var objvalue = obj.options[obj.selectedIndex].value;

        	if(obj.options[obj.selectedIndex].value=="teacher"){
        		document.getElementById("attr3").innerHTML = "COURSE";
        		document.getElementById("attr4").innerHTML = "DEPARTMENT";
        	}else{
        		document.getElementById("attr3").innerHTML = "GRADE";
        		document.getElementById("attr4").innerHTML = "SCORE";
        	}
        	//if(document.getElementById("whattable"))
        }</script>
    </head>
</html>