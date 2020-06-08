<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga Proprietate</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminAddPropStyle.css">

</head>
<body>
<div class="box">
	<div class="navbar">
		<a href = "adminPage.jsp">Acasa</a>
		<a href = "adminProprietatiTabel.jsp">Vezi proprietatile</a>
	</div>
</div>
<div class="container">
	<form method="post" action="adminInsertDataProp.jsp">
		<table class = "center" border="1">
			<thead>
				<tr>		
					<th colspan="2">Adauga informatiile aici:</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Tip proprietate</td>
					<td><input type="text" name="tip" value=""/></td>
				</tr>
				<tr>
					<td>Localizare</td>
					<td><input type = "text" name="localizare" value=""/></td>
				</tr>
				<tr>
					<td>Suprafta</td>
					<td><input type="text" name="suprafata" value=""/></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit" class="btn"/></td>
					<td><input type="reset"  value ="Reset" class="btn"/></td>
				</tr>
				
			</tbody>		
		</table>
	</form>
</div>
</body>
</html>