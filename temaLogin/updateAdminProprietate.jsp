<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update proprietate</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="adminUpdatePropStyle.css">
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

        String prop = request.getParameter("IDprop");
    	//se executa interogarea bazei de date
    	ResultSet rs;
    	rs = st.executeQuery("SELECT * FROM proprietati WHERE proprietate ='"+prop+"' ");
   		
    	if(rs != null){
    		rs.next();
        %>
<div class="container">
<form name="frmUpdate" method="post" action="saveUpdateProprietate.jsp?propID=<%=rs.getString("proprietate")%>">
	Formular de update
		<ul>  
			<li>Proprietate: <%= rs.getString("proprietate") %></li>
			<br>
			<li>Tip proprietate: <input type ="text" name="tip" value="<%=rs.getString("tip_proprietate")%>"></li>
			<br>
			<li>Localizare: <input type ="text" name="adresa" value="<%=rs.getString("localizare")%>"></li>
			<br>
			<li>Suprafata: <input type ="text" name="suprafata" value="<%=rs.getString("suprafata")%>"></li>
			<br>
		</ul>
	<input type="submit" value="Salveaza" class="btn">
</form>
	<br><a href='adminPage.jsp'>Acasa</a>
	<br><a href='adminProprietatiTabel.jsp'>Vezi proprietatile</a>
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