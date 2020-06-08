<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>

<% 
	Connection con = null;
	Statement st = null;
        
	//creare conexiune cu baza de date
 	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

        String cod = request.getParameter("IDop");
    	//se executa interogarea bazei de date
    	ResultSet rs;
    	
    	//se sterge anuntul precizat
    	int i = 0;
    	i = st.executeUpdate("DELETE FROM operatii WHERE cod_operatie = '"+cod+"'");
    	
    	if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("inregReusitaAdmin.jsp");//daca s-a inserat inregistrarea, se deschide inregReusitaAdmin.jsp
           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {	
            //response.sendRedirect("index.jsp");//daca nu s-a inserat inregistrarea, se deschide index.jsp
        	 out.print("Ceva nu a mers bine!"+"<a href='adminPage.jsp'>acasa</a>");
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