<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga Anunt</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminAddAnStyle.css">

</head>
<body>
<div class="box">
	<div class="navbar">
		<a href = "adminPage.jsp">Acasa</a>
		<a href = "adminAnunturiTabel.jsp">Vezi anunturi</a>
	</div>
</div>
<div class="container">
	<form method="post" action="adminInsertData.jsp">
		<table class = "center" border="1">
			<thead>
				<tr>		
					<th colspan="2">Adauga informatiile aici:</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>cod_operatie (intre 1 si 3) -- se trece 1 in caz contrar</td>
					<td><input type="text" name="cod" value=""/></td>
				</tr>
				<tr>
					<td>proprietate</td>
					<td><input type="text" name="proprietate" value=""/></td>
				</tr>
				<tr>
					<td>proprietar</td>
					<td><input type = "text" name="proprietar" value=""/></td>
				</tr>
				<tr>
					<td>contact</td>
					<td><input type="text" name="contact" value=""/></td>
				</tr>
				<tr>
					<td>restrictii</td>
					<td><input type="text" name="restrictii" value=""/></td>
				<tr>
					<td><input type="submit" value="Submit" class="btn"/></td>
					<td><input type="reset"  value ="Reset" class="btn"/></td>
				</tr>
				
			</tbody>		
		</table>
		<br>Cod operatie 1 --- inchiriere
		<br>Cod operatie 2 --- vanzare
		<br>Cod operatie 3 --- arenda
	</form>
</div>
</body>
</html>