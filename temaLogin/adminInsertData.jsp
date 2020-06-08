<%@ page import ="java.sql.*" %>
<%
	//se creaza conexiunea cu baza de date
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
            "root", "");
    Statement st = con.createStatement();
    
    //se stocheaza in variabile valorile introduse in adminInsertAnunt.jsp
    String codOperatie = request.getParameter("cod");
    String proprietate = request.getParameter("proprietate");
    String proprietar = request.getParameter("proprietar");
    String contact = request.getParameter("contact");
    String restricitii = request.getParameter("restrictii");


    if((!(codOperatie.equals("1"))) || (!(codOperatie.equals("2"))) || (!(codOperatie.equals("3"))))
	codOperatie="1";
    
	//se insereaza valorile in tabelul anunturi
	try{
    int i = st.executeUpdate("INSERT INTO anunturi(cod_operatie, proprietate, nume_proprietar, contact_proprietar, restrictii_contact)"+
    		"VALUES ('" + codOperatie + "','" + proprietate + "','" + proprietar + "','" + contact + "','" + restricitii + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("inregReusitaAdmin.jsp");//daca s-a inserat inregistrarea, se deschide inregReusitaAdmin.jsp
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        response.sendRedirect("adminAnunturiTabel.jsp"); // afiseaza tabelul cu anunturi
    } else {	
        //response.sendRedirect("index.jsp");//daca nu s-a inserat inregistrarea, se deschide index.jsp
    	 
	out.print("Ceva nu a mers bine!"+"<a href='adminPage.jsp'>acasa</a>");
    }
	}
	catch (Exception e){
		out.print("Ceva nu a mers bine!"+"<a href='adminPage.jsp'>acasa</a>");
	}
%>