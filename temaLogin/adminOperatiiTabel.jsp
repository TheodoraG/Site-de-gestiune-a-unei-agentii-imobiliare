<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Operatii admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminTabelOpStyle.css">
</head>
<body>
<H1>Tabelul operatii</H1>
<fieldset>
<% 
	Connection con = null;
 	Statement st = null;
 		
	//creare conexiune cu baza de date
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

    	//se executa interogarea bazei de date
    	ResultSet rs;
    	rs = st.executeQuery("SELECT * FROM operatii");
%>
 
<button name="operatii" class="btn" onclick="document.location = 'adminInsertOperatie.jsp'">Adauga operatie</button>
<br><br>
<table id="tabel">
	<thead>
		<tr>
			<th >Cod Operatie</th>
			<th>Denumire Operatie</th>
			<th>Sterge</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("cod_operatie") %></td>
			<td><%= rs.getString("denumire_operatie")%></td>			
			<td><a href ="deleteAdminOperatie.jsp?IDop=<%=rs.getString("cod_operatie")%>">Sterge</a></td>
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