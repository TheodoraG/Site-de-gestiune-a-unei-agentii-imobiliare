<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="userPageStyle.css">

</head>
<body>

<fieldset>
	<div style="text-align:center">
		<h2>Vezi proprietatile care indeplinesc anumite conditii</h2>
	</div>
	
	<form action="userProprietatiTabel.jsp" method="post" enctype="multipart/formdata">
	<div class="row">
		<div class="column">
			<label for="tip">Tip de proprietate</label><br>
			<select name="tip">
				<option value="apartament">apartament</option>
				<option value="casa">casa</option>
				<option value="teren">teren</option>
				<option value="spatiu">spatiu de birouri</option>
			</select><br>
		</div>
		
		<div class="column">
			<label for="localizare">Localizare: </label><br>
			<select name="localizare">
				<option value="Cluj">Cluj</option>
				<option value="Iasi">Iasi</option>
				<option value="Bucuresti">Bucuresti</option>
			</select><br>
			<label for="suprafata">Suprafata: </label><br>
			<select name="suprafata">
				<option value="<100">mai putin de 100 mp</option>
				<option value="100-500">intre 100 - 500 mp</option>
				<option value=">500">mai mare ca 500 mp</option>
			</select><br>
			<br><br>
			<input type="submit" value="Submit" class="btn">
		</div>
	</div>
	
	</form>
	
	<a href='logout.jsp'>Log out</a>
</fieldset>


</body>
</html>