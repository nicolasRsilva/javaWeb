<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%
	
	String email = request.getParameter("txtEmail");
	String senha = request.getParameter("txtSenha");
	String frase = request.getAttribute("frase").toString();
	
	int soma = (int)request.getAttribute("v1") + (int)request.getAttribute("v2");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reposta da Servlet</title>
</head>
<body>
	<h1>Resultado:</h1>
	<h3>E-mail: <%= email%></h3> <%//valor do igual é como se fosse o print %>
	<h3>Senha: <%= senha%></h3>
	<h3>Frase: <%= frase%></h3>
	<h3>Soma: <%= soma %></h3>
	
</body>
</html>