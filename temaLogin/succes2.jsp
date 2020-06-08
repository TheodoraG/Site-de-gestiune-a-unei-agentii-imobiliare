<html>
<head>
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="loginStyle.css">
</head>

<body>
<div class="box">

<%
 	if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || (session.getAttribute("passInput")=="") || (session.getAttribute("passInput")==null)) {
%>
		Nu esti logat<br/>
		<br><button class="btn" onclick="document.location ='index.jsp'">Te rugam sa te loghezi
<%} else if(!(session.getAttribute("passInput").equals(session.getAttribute("pass")))){
%>
		Parola incorecta<br>
		<br><button class="btn" onclick="document.location ='index.jsp'">Te rugam sa te loghezi din nou</button><br>
<%}else {if(!session.getAttribute("role").equals(session.getAttribute("radioB"))){
%>	
		Rolul selectat nu coincide cu cel din baza de date<br>
		In baza de date ai rolul: <%=session.getAttribute("role") %><br>
		Ai selectat butonul: <%=session.getAttribute("radioB") %>
		<br><button class="btn" onclick="document.location ='index.jsp'">Te rugam sa te loghezi din nou</button><br>
<%}else if(session.getAttribute("role").equals(session.getAttribute("radioB"))){
%>
		Bine ai venit, <%=session.getAttribute("first_name") %> <%=session.getAttribute("last_name") %>!<br>
		Esti logat ca <%=session.getAttribute("role") %><br>
<%
		if(session.getAttribute("role").equals("admin")){
%>
			<br><button class="btn" onclick="document.location ='adminPage.jsp'">Mergi la pagina de admin</button><br>
<%
		}else if(session.getAttribute("role").equals("user")){
%>
			<br><button class="btn" onclick="document.location ='userPage.jsp'">Mergi la pagina de user</button><br>
<%
		}else if(session.getAttribute("role").equals("user inregistrat")){
%>
			<br><button class="btn" onclick="document.location ='userInregPage.jsp'">Mergi la pagina de user inregistrat</button><br>
<%
		}
%>
		<br><button class="btn" onclick="document.location ='logout.jsp'">Log out</button><br>
<%}}
%>


</div>
</body>
</html>