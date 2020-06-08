<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminStyle.css">

</head>
<body>
<button name="operatiile" class="btn" onclick="document.location = 'logout.jsp'">Log out</button>
<fieldset>
	<h1>Tabelele disponibile:</h1>
	<ul>
		<li>Anunturi
			<button name="anunturile" class="btn" onclick="document.location = 'adminAnunturiTabel.jsp'">Anunturi</button>
		</li>
		<br>
		<li>Proprietati
			<button name="proprietatile" class="btn" onclick="document.location = 'adminProprietatiTabel.jsp'">Proprietati</button>
		</li>
		<br>
		<li>Operatii
			<button name="operatiile" class="btn" onclick="document.location = 'adminOperatiiTabel.jsp'">Operatii</button>
		</li>
	</ul>
	<br>

</fieldset>
</body>
</html>