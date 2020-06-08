<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Proprietati</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminTabelPropStyle.css">
</head>
<body>
<H1>Tabelul proprietati</H1>
<fieldset>
<% 
	Connection con = null;
 	Statement st = null;
 		
	//creare conexiune
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

    	//se executa interogarea bazei de date
    	ResultSet rs;
    	rs = st.executeQuery("SELECT * FROM proprietati");
%>
 
<button name="proprietati" class="btn" onclick="document.location = 'adminInsertProprietate.jsp'">Adauga proprietate</button>
<br><br>
<table id="tabel">
	<thead>
		<tr>
			<th >Proprietate</th>
			<th >Tip proprietate</th>
			<th>Localizare</th>
			<th>Suprafata</th>
			<th>Modifica</th>
			<th>Sterge</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("proprietate") %></td>
			<td><%= rs.getString("tip_proprietate")%></td>			
			<td><%= rs.getString("localizare")%></td>
			<td><%= rs.getString("suprafata")%></td>
			<td><a href="updateAdminProprietate.jsp?IDprop=<%=rs.getString("proprietate")%>">Modifica</a></td>
			<td><a href="deleteAdminProprietate.jsp?IDprop=<%=rs.getString("proprietate")%>">Sterge</a></td>
		</tr>
		<%} %>
</table>
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