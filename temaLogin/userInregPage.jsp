<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Inregistrat</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="userInregStyle.css">
</head>
<body>
<div >
<fieldset>
<H1>Proprietati si anunturi</H1>
<br>
<% 
	Connection con = null;
 	Statement st = null;
 		
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

    	//se executa interogarea bazei de date
    	//s-a facut un join intre tabelul anunturi si tabelul proprietati
    	//pt ca utilizatorul sa vada informatiile pe care le-a introdus
    	ResultSet rs;
    	rs = st.executeQuery("SELECT proprietati.proprietate, tip_proprietate,"+
    			" localizare, suprafata, cod_operatie, nume_proprietar, contact_proprietar,"+ 
    			" restrictii_contact "+
    			"FROM proprietati, anunturi "+
    			"WHERE proprietati.proprietate = anunturi.proprietate");
%>
 
<table id="tabel">
	<thead>
		<tr>
			<th >Proprietate</th>
			<th >Tip proprietate</th>
			<th>Localizare</th>
			<th>Suprafata</th>
			<th>Cod operatie</th>
			<th>Nume proprietar</th>
			<th>Contact proprietar</th>
			<th>Restrictii contact</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("proprietate") %></td>
			<td><%= rs.getString("tip_proprietate") %></td>
			<td><%= rs.getString("localizare") %></td>
			<td><%= rs.getString("suprafata") %></td>
			<td><%= rs.getString("cod_operatie")%></td>			
			<td><%= rs.getString("nume_proprietar")%></td>
			<td><%= rs.getString("contact_proprietar")%></td>
			<td><%= rs.getString("restrictii_contact")%></td>
		</tr>
		<%} %>
</table>
	<br>
	<br>Cod operatie = 1 -- inchiriere
	<br>Cod operatie = 2 -- vanzare
	<br>Cod operatie = 3 -- arenda

<% }catch(Exception e){
		out.println(e.getMessage());
		e.printStackTrace();
}
 	try {
 		if(st!=null){
 			st.close();
 			con.close();
 		}
 	}catch (SQLException e) {
 		out.println(e.getMessage());
 		e.printStackTrace();
 	}
%>
</fieldset>	
</div>
<br><br>
<div >

<fieldset>
	<div style="text-align:center">
		<h2>Introdu o proprietate</h2>
	</div>
	
	<form action="userInregAddInfo.jsp" target="_self" method="post" enctype="multipart/formdata">
	<div class="row">
		<div class="column">
			<label for="tip">Tip de proprietate</label><br>
			<select name="tip">
				<option value="apartament">apartament</option>
				<option value="casa">casa</option>
				<option value="teren">teren</option>
				<option value="spatiu">spatiu de birouri</option>
			</select><br>
			<label for="operatie">Denumire operatie</label><br>
			<select name="operatie">
				<option value="inchiriere">inchiriere</option>
				<option value="vanzare">vanzare</option>
				<option value="arenda">arenda</option>
			</select><br>
		</div>
		
		<div class="column">
			<label for="nume">Nume</label><br>
			<input type="text" name="nume" placeholder="Ion Popescu" size="20"><br><br>
			<label for="email">Email/Telefon :</label><br>
			<input type="text" name="email" placeholder="nume@mail.com" size="20"><br><br>
			<label for="restrictii">Restrictii contract</label><br>
			<textarea name="restrictii" placeholder="Mesaj..." style="height:100px"></textarea><br>
			<label for="supraf">Suprafata</label><br>
			<input type="text" name="supraf" placeholder="200mp" size="20"><br><br>
			<label for="adresa">Adresa</label><br>
			<input type="text" name="adresa" placeholder="Oras" size="20"><br><br>
			<input type="submit" value="Submit">
		</div>
	</div>
	
	</form>
	
	<button name="logOut" class="btn" onclick="document.location='logout.jsp'">Log out</button>
</fieldset>

</div>
</body>
</html>