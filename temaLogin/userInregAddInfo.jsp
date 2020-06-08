<%@ page import ="java.sql.*" %>
<%
	//se creaza conexiunea cu baza de date
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
            "root", "");
    Statement st = con.createStatement();
    
    //se stocheaza in variabile valorile introduse in adminInsertAnunt.jsp
    String tip = request.getParameter("tip");
    String operatie = request.getParameter("operatie");
	String proprietar = request.getParameter("nume");
    String contact = request.getParameter("email");
    String restricitii = request.getParameter("restrictii");
    String suprafata = request.getParameter("supraf");
    String adresa = request.getParameter("adresa");
    String codOp ="";
    
    if(operatie.equals("inchiriere"))
    	codOp = "1";
    else if(operatie.equals("vanzare"))
    	codOp = "2";
    else if(operatie.equals("arenda"))
    	codOp = "3";
    
    //se insereaza valorile in tabelul proprietati
    int i1 = st.executeUpdate("INSERT INTO proprietati(tip_proprietate, localizare, suprafata)"+
    		"VALUES ('" + tip + "','" + adresa + "','" + suprafata + "')");
    
    //se selecteaza proprietatea nou introdusa
    ResultSet rs = st.executeQuery("SELECT * FROM proprietati WHERE tip_proprietate='"+
    		tip+"' AND localizare ='"+adresa+"' AND suprafata ='"+suprafata+"'");
    String proprietate = "";
    while(rs.next()){
    	proprietate =rs.getString("proprietate");
    }
    
    if (i1 > 0) {
		//se insereaza valorile in tabelul anunturi
    	int i = st.executeUpdate("INSERT INTO anunturi(cod_operatie, proprietate, nume_proprietar, contact_proprietar, restrictii_contact)"+
    		"VALUES ('" + codOp + "','" + proprietate + "','" + proprietar + "','" + contact + "','" + restricitii + "')");
   
		if (i > 0) {
       		response.sendRedirect("inregOkUserInreg.jsp"); // afiseaza mesajul de confirmare a modificarii
    	} else {	
       		out.print("Ceva nu a mers bine!"+"<a href='userInregPage.jsp'>acasa</a>"); //mesaj de eroare
    	}
    }
    else{
    	out.print("Ceva nu a mers bine!"+"<a href='userInregPage.jsp'>acasa</a>");
    }
%>