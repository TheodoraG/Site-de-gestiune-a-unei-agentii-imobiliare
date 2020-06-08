<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="regStyle.css">

</head>
<body>

<button class="btn">Deja ai cont?
<a href="index.jsp">Logheaza-te aici</a>
</button>
<div class="container">
	<form method="post" action="registration.jsp">
		<table class = "center" border="1">
			<thead>
				<tr>		
					<th colspan="2">Adauga informatiile aici:</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Prenume</td>
					<td><input type="text" name="first_name" value=""/></td>
				</tr>
				<tr>
					<td>Nume</td>
					<td><input type="text" name="last_name" value=""/></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" value=""/></td>
				</tr>
				<tr>
					<td>User Name</td>
					<td><input type = "text" name="username" value=""/></td>
				</tr>
				<tr>
					<td>Parola</td>
					<td><input type="password" name="password" value=""/></td>
				</tr>
				<tr>
					<td>Rol</td>
					<td ><input type="radio" id="admin" name="role" value="admin">Admin
					<input type ="radio" id= "user" name="role" value="user">User
					<input type ="radio" id= "user inregistrat" name="role" value="user inregistrat">User Inregistrat</td>
					
				<tr>
					<td><input type="submit" value="Login" class="btn"/></td>
					<td><input type="reset"  value ="Reset" class="btn"/></td>
				</tr>
							
			</tbody>		
		</table>
	</form>
</div>
</body>
</html>