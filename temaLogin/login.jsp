<%@ page import ="java.sql.*" %>
<%
	//se aduc din index.jsp valorile pt campurile din baza de date
	//valorile din index.jsp sunt cele introduse de utilizator
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    
    //conexiunea cu baza de date
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
            "root", "");
    
    //selectarea unui membru din baza de date dupa username
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM membri WHERE USERNAME='" + userid + "'");
    //retinerea campurilor necesare din inregistrarea selectata
    if (rs.next()) {
        session.setAttribute("userid", userid); //in userid se gaseste username-ul din baza de date
        session.setAttribute("role",rs.getString("role")); //in role se gaseste rolul din baza de date
        session.setAttribute("first_name",rs.getString("first_name"));//in first_name este prenumele din baza de date
        session.setAttribute("last_name",rs.getString("last_name"));//in last_name este numele din baza de date
        session.setAttribute("pass",rs.getString("password"));//in pass e parola din baza de date
        out.println("welcome " + userid);
      	out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("succes2.jsp");//daca s-a gasit un utilizator cu username-ul dat de utilizator, se deschide succes2.jsp
    } else {
        out.println("Date invalide <a href='index.jsp'>Incearca din nou</a>");//daca nu se gaseste, datele sunt invalide
    }
    
   	//se aduce din index.jsp butonul selectat de utilizator
	if(request.getParameter("role") !=null){
		if(request.getParameter("role").equals("admin")){//daca s-a selectat cel de admin
			out.println("logare ca Administrator<BR>");
			session.setAttribute("radioB", "admin");//se va retine butonul selectat 
		}
		if(request.getParameter("role").equals("user")){//daca s-a selectat cel de user
			out.println("logare ca user obisnuit<BR>");
			session.setAttribute("radioB", "user");//se va retine butonul selectat 
		}
		if(request.getParameter("role").equals("user inregistrat")){//daca s-a selectat cel de user inregistrat
			out.println("logare ca user inregistrat<BR>");
			session.setAttribute("radioB", "user inregistrat");//se va retine butonul selectat 
		}
		}
   	
   	//in passInput se retine parola scrisa de utilizator
	if(request.getParameter("password") != null){
		session.setAttribute("passInput",request.getParameter("password"));
	}
	
%>
