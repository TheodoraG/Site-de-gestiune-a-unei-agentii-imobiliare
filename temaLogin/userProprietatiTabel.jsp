<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proprietati gasite</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="userProprStyle.css">
</head>
<body>
<br>
<fieldset>
<div class="box">
	<div class="navbar">
		<a href='userPage.jsp'>Acasa</a>
	</div>
</div>
<H1>Proprietati gasite</H1>
<br>
<% 
	Connection con = null;
 	Statement st = null;
 		
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();
		
      //se aduc din userPage.jsp valorile pt campurile din baza de date
    	String tip_propr = request.getParameter("tip");    
        String localizare = request.getParameter("localizare");
        String suprafata = request.getParameter("suprafata");
        
    	//se executa interogarea bazei de date
    	ResultSet rs;
    	if(request.getParameter("suprafata").equals("<100"))
       		rs = st.executeQuery("SELECT * FROM proprietati WHERE tip_proprietate='" + tip_propr + "' AND localizare='" + localizare + "' AND suprafata BETWEEN 0 AND 100");
    	else if(request.getParameter("suprafata").equals("100-500"))
    		rs = st.executeQuery("SELECT * FROM proprietati WHERE tip_proprietate='" + tip_propr + "' AND localizare='" + localizare + "' AND suprafata BETWEEN 100 AND 500");
    	else
    		rs = st.executeQuery("SELECT * FROM proprietati WHERE tip_proprietate='" + tip_propr + "' AND localizare='" + localizare + "' AND suprafata BETWEEN 500 AND 1000");
      
%>

<table id="tabel">
	<thead>
		<tr>
			<th >Proprietate</th>
			<th >Tip proprietate</th>
			<th>Localizare</th>
			<th>Suprafata</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("proprietate") %></td>
			<td><%= rs.getString("tip_proprietate")%></td>			
			<td><%= rs.getString("localizare")%></td>
			<td><%= rs.getString("suprafata")%></td>
		</tr>
		<%} %>
</table>
	<br>


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