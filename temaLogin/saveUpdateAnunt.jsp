<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>

 <% 
	Connection con = null;
	Statement st = null;
        
	try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
                "root", "");
        st = con.createStatement();

        String an = request.getParameter("anuntID");
        String proprietar = request.getParameter("propr");
        String contact = request.getParameter("contact");
        String restrictii = request.getParameter("restrictii");
    	//se executa interogarea bazei de date
    	    	
    	int i = 0;    	
    	
    	i = st.executeUpdate("UPDATE anunturi SET nume_proprietar='"+
    		proprietar+"', contact_proprietar ='"+
    		contact+"', restrictii_contact='"+
    		restrictii+"' WHERE anunt ='"+
    		an+"' ");
    	
    	
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
