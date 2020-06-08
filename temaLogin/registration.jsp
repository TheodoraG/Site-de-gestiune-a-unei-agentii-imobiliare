<%@ page import ="java.sql.*" %>
<%
	//se aduc din reg.jsp valorile pt campurile din baza de date
	//valorile din reg.jsp sunt cele scrise de utilizator
    String user = request.getParameter("username");    
    String pwd = request.getParameter("password");
    String fname = request.getParameter("first_name");
    String lname = request.getParameter("last_name");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    
  	//se creaza conexiunea cu baza de date
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agentie",
            "root", "");
    Statement st = con.createStatement();

	//se insereaza valorile in baza de date
    int i = st.executeUpdate("INSERT INTO membri(first_name, last_name, email, username, password, role)"+
    		"VALUES ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','"+ role+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");//daca s-a inserat inregistrarea, se deschide welcome.jsp
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {	
        response.sendRedirect("index.jsp");//daca nu s-a inserat inregistrarea, se deschide index.jsp
    }
%>