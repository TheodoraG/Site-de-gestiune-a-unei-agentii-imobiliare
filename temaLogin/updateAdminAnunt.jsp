<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Anunt</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminUpdateAnStyle.css">
</head>
<body>

        <% 
        Connection con = null;
        Statement st = null;
        
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

        String an = request.getParameter("IDanunt");
    	//se executa update-ul bazei de date
    	ResultSet rs;
    	rs = st.executeQuery("SELECT * FROM anunturi WHERE anunt ='"+an+"' ");
   		
    	if(rs != null){
    		rs.next();
        %>
<div class="container">
<form name="frmUpdate" method="post" action="saveUpdateAnunt.jsp?anuntID=<%=rs.getString("anunt")%>">
	<h1>Formular de update</h1>
		<ul>  
			<li>Anunt: <%= rs.getString("anunt") %></li>
			<br>
			<li>Cod operatie: <%= rs.getString("cod_operatie") %></li>
			<br>
			<li>Proprietate: <%= rs.getString("proprietate") %></li>
			<br>
			<li>Proprietar: <input type ="text" name="propr" value="<%=rs.getString("nume_proprietar")%>"></li>
			<br>
			<li>Contact: <input type ="text" name="contact" value="<%=rs.getString("contact_proprietar")%>"></li>
			<br>
			<li>Restrictii contact: <input type ="text" name="restrictii" value="<%=rs.getString("restrictii_contact")%>"></li>
			<br>
		</ul>
	<input type="submit" value="Salveaza" class="btn">
</form>
	<br><a href='adminPage.jsp'>Acasa</a>
	<br><a href='adminAnunturiTabel.jsp'>Vezi anunturile</a>
</div>
<%
    	}
        }catch(Exception e){
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
</body>
</html>