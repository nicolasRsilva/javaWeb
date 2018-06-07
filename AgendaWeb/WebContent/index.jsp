<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%
	
	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");
	
	if (u == null){
		response.sendRedirect("login.html");
	}else{ //todo
		
	


	//teste de recuperaçãao de valores via request
	//String senha = request.getParameter("txtSenha");

%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Reposta da Servlet</title>
		</head>
		<body>
			<h1>Resultado:</h1>
			<h3>Nome: <%= u.getNome()%></h3> <%//valor do igual(=) é como se fosse o print %>
			<h3>Senha: <%= u.getSenha()%></h3>
			<h3>Email: <%= u.getEmail()%></h3>
			<h3>Data de Nascimento: <%= u.getDtNasc()%></h3>
			<h3>Cidade: <%= u.getCidade()%></h3>
		
		</body>
		</html>
	<%}%>