<%@ page import ="java.sql.*" %>
<%
	//se creaza conexiunea cu baza de date
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
            "root", "");
    Statement st = con.createStatement();
    
    //se stocheaza in variabile valorile introduse in adminInsertProprietate.jsp
    String tipPropr = request.getParameter("tip");
    String localizare = request.getParameter("localizare");
    String suprafata = request.getParameter("suprafata");
  
	//se insereaza valorile in tabelul proprietati
    int i = st.executeUpdate("INSERT INTO proprietati(tip_proprietate, localizare, suprafata)"+
    		"VALUES ('" + tipPropr + "','" + localizare + "','" + suprafata + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("inregReusitaAdmin.jsp");//daca s-a inserat inregistrarea, se deschide inregReusitaAdmin.jsp
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        response.sendRedirect("adminProprietatiTabel.jsp"); // afiseaza tabelul cu anunturi
    } else {	
        //response.sendRedirect("index.jsp");//daca nu s-a inserat inregistrarea, se deschide index.jsp
    	 out.print("Ceva nu a mers bine!"+"<a href='adminPage.jsp'>acasa</a>");
    }
%>