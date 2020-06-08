<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Anunturi</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminTabelAnStyle.css">
</head>
<body>

<H1>Tabelul anunturi</H1>

<fieldset>
<% 
	Connection con = null;
 	Statement st = null;
 	
	//creare conexiune baza de date	
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

    	//se executa interogarea bazei de date
    	ResultSet rs;
    	rs = st.executeQuery("SELECT * FROM anunturi");
%>
 
<button name="anunturi" class="btn" onclick="document.location = 'adminInsertAnunt.jsp'">Adauga anunt</button>
<br><br>
<table id="tabel">
	<thead>
		<tr>
			<th >Anunt</th>
			<th >Cod Operatie</th>
			<th>Proprietate</th>
			<th>Nume proprietar</th>
			<th>Contact proprietar</th>
			<th>Restrictii contact</th>
			<th>Mofdifica</th>
			<th>Sterge</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("anunt") %></td>
			<td><%= rs.getString("cod_operatie")%></td>
			<td><%= rs.getString("proprietate")%></td>			
			<td><%= rs.getString("nume_proprietar")%></td>
			<td><%= rs.getString("contact_proprietar")%></td>
			<td><%= rs.getString("restrictii_contact")%></td>
			<td><a href="updateAdminAnunt.jsp?IDanunt=<%=rs.getString("anunt")%>">Modifica</a></td>
			<td><a href ="deleteAdminAnunt.jsp?IDanunt=<%=rs.getString("anunt")%>">Sterge</a></td>
		</tr>
		<%} %>
</table>
	<br>
	<br>
	<button name="acasa" class="btn" onclick="document.location = 'adminPage.jsp'">Acasa</button>

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

</body>
</html>