<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styleIndex.css">

</head>
<body>
<div class="container">
	<form method="post" action="login.jsp">
		<h1> Login</h1>
		
		<label for="username""><b>Utilizator</b></label>
		<input type = "text" name="username" value=""/>
		<br><br>
		<label for="password""><b>Parola</b></label>
		<input type="password" name="password" value=""/>
		<br><br>
		<label for="role""><b>Rol</b></label>
		<input type="radio" id="admin" name="role" value="admin">Admin
		<input type ="radio" id= "user" name="role" value="user">User
		<input type ="radio" id= "user inregistrat" name="role" value="user inregistrat">User Inregistrat
		<br><br>
		<input type="submit" value="Login" class="btn"/>
		<input type="reset"  value ="Reset" class="btn"/>
		<br><br>
		<p>Nu ai cont inca? <a href="reg.jsp">Inregistreaza-te aici</a></p>
		
		
	</form>
</div>
</body>
</html>