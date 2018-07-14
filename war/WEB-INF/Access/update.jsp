<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Role"%>
<%@ page import="model.entity.Resource"%>
<%@ page import="model.entity.Access"%>
<%List<Role> roles= (List<Role>) request.getAttribute("roles");%>
<%List<Resource> resources= (List<Resource>) request.getAttribute("resources");%>
<%Access e = (Access) request.getAttribute("access");%>
<!DOCTYPE html>
<html lang=es>
<head>
	<title>Update Access</title>
	<style type="text/css">
		body{
			background-color: #A4A4A4;
		}
		*{
			padding: 0px;
			margin:0px;
		}
		#header{
			margin:auto;
			width: 558px;
			font-family: Arial, Helvetica, sans-serif;

		}
		ul, ol{
			list-style: none;
		}
		.nav li a{
			background-color: #000;
			color: #fff;
			text-decoration: none;
			padding: 10px 15px;
			display: block;
		}
		.nav > li{
			float: left;
		}
		.nav li  a:hover{
			background-color: #434343;
		}
		.nav li ul {
			display:none;
			position: absolute;
			min-width: 140px;
		}
		.nav li:hover > ul{
			display: block;
		}
		.table1 {
			width: 95%;
			text-align: center;
			border-collapse: collapse;
			background-color: white;
		}
		h1{
			font-family: Arial, Helvetica, sans-serif;
		}
		th, td{
			padding: 10px;
		}
		td{
			font-size: 15px;
			font-family: Arial, Helvetica, sans-serif;
		}
		th{
			font-size: 20px;
			font-family: Arial, Helvetica, sans-serif;
		}
		thead{
			background-color:#000;
			border-bottom:solid 1px #000;
			color:white;
		}
		tr:nth-child(even){
			background-color:#ddd;
		}
		tr:hover td{
			background-color:#076CF5;
			color:white;
			transition: all .3s ease;
		}
		tr:hover a{
			color: white;
			transition: all .3s ease;	
		}
		.div2{
			width: 100%;
			text-align: left;
		}
		.form{
			width: 26%;
			text-align: left;
			border-collapse: collapse;
			margin-left: 33px;
			font-family:  Arial, Helvetica, sans-serif;
			font-size: 20px;
		}
		.div2 input{
			font-family:  Arial, Helvetica, sans-serif;
			width: 95%;
			height: 35px;
		}
		.btn-submit{
	
			width: 100%;
			font-family: Roboto;
			outline: none;
			font-size: 16px;
			border: none;
			cursor: pointer;
			transition: all .5s ease;
		}
		.btn-submit:hover{
			background: #076CF5;
			color: white;
		}
		colspan{
		font-size: 15px;
		font-family: Arial, Helvetica, sans-serif;
		}	

	</style>
<body>
	<div id="header">
		<ul class="nav">
			<li><a href="">Events</a>
				<ul>
					<li><a href="/events">View Events</a></li>
					<li><a href="/event/add?action=eventCreate">Add Events</a></li>
				</ul>
			</li>
			<li><a href="">Users</a>
				<ul>
					<li><a href="/users">View Users</a></li>
					<li><a href="/user/add?action=userCreate">Add User</a></li>
				</ul>
			</li>
			<li><a href="">Roles</a>
				<ul>
					<li><a href="/roles">View Roles</a></li>
					<li><a href="/roles/add?action=rolesCreate">Add Role</a></li>
				</ul>
			</li>
			<li><a href="">Resources</a>
				<ul>
					<li><a href="/resources">View Resources</a></li>
					<li><a href="/resources/add?action=resourcesCreate">Add Resource</a></li>
				</ul>
			</li>
			<li><a href="">Access</a>
				<ul>
					<li><a href="/access">View Access</a></li>
					<li><a href="/access/add?action=accessCreate">Add Access</a></li>
				</ul>
			</li>
			<li><a href="/login">Login</a></li>
			<li><a href="/logout">Logout</a></li>
		</ul>	
	</div>
	<br>
	<br>
	<BR>
	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UPDATE ACCESS</h1>
	<br>
	<BR>
	<div class="div2" align="center">
		<form name="miFormulario" class="form" method="get" action="/access/edit">
		<input type="hidden" name="action" value="accessCreateDo"/>
				
		<label for="role" class="form-label">Role:</colspan></label><br>
		<input type="text" value="<%= e.getRoleAccess()%>" readonly="readonly"/>
		<br><br>
		<label for="resource" class="form-label">Resources: <colspan>(<%=e.getResourceAccess()%>)</colspan></label><br>
		<select name="resource" id="resource">
			<option value="none">default</option>
			<%for (int i = 0; i < resources.size(); i++) {%>
			<%Resource a= (Resource) resources.get(i);%>
				<%if(a.getResourceStatus()==true){%>
				<option value="<%=a.getResourceName()%>"><%=a.getResourceName()%></option>
			<%}%>
				
			<%} %>
		</select>
		<br><br>
		<label for="status" class="form-label">Event Status: <colspan>(<%=e.getAccessStatus()%>)</colspan></label><br>
		<select name="status" id="status">
  			<option value="none">Default</option>
  			<option value="true">true</option>
  			<option value="false">false</option>
  		</select>
  		<br><br>
		<input type="hidden" id="accessId2" name="accessId2" class="form-input" value="<%=e.getId()%>">
		<input type="submit" class="btn-submit" value="Update access">
		<br><br>
	</form>
	</div>
</body>
</html>