<%@page import="br.senai.sp.jandira.dao.ContatoDao"%>
<%@page import="br.senai.sp.jandira.modelo.Contato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%

	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	ArrayList<Contato>listaContatos = new ArrayList();

	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");

	if (u == null){
		response.sendRedirect("login.html");
	}else{ 
		ContatoDao c = new ContatoDao();
		listaContatos = c.getContatos(u.getId());
		
	


	//teste de recuperaçãao de valores via request
	//String senha = request.getParameter("txtSenha");

%>
		<!DOCTYPE html>
		<html>
		<body>
		<!-- CABEÇALHO DA PÁGINA -->
		<header>
		<div class="navbar navbar-default">
			<div class="row">
				<div class="col-md-12">
					<h1 style="color:black"><img src="imagens/calendar.png" height="24px" width="24px" style="margin-right: 24px; margin-left: 24px;">Agenda Contatos</h1>
				</div>
			</div>
		</div>
		<link href="css/bootstrap.css" rel="stylesheet">
		</header>
		
		<!-- CONTEÚDO DA PÁGINA -->
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="panel panel-primary">
					 <div class="panel-heading"><strong><img src="imagens/if_Hamburger_list_menu_options_bars_stack_1887037.png" height="24px" width="24px" style="margin-right: 24px;">Usuário</strong></div>
					 <div class="panel-body">
					    <p><strong>Usuario: </strong><%=u.getNome()%></p>
					    <p><strong>Cidade: </strong><%=u.getCidade()%></p>
					    <p><strong>Dt.Nasc.: </strong><%=u.getDtNasc()%></p>
					    <p>
					    	<a href="sair.jsp"><img src="imagens/exit.png" height="24px" width="24px" style="margin-right: 24px;">Efetuar Logout</a>
					    </p>
					    
					 </div>
					</div>
					<div class="panel panel-primary">
					 <div class="panel-heading"><strong><img src="imagens/if_user_285655.png" height="24px" width="24px" style="margin-right: 24px;">Menu</strong></div>
					 <div class="panel-body">
					    <ul class="nav">
					    	<li class="nav-item"><a href="index.jsp">Home</a></li>
					    	<li class="nav-item"><a href="cadastrar_contato.jsp">Cadastrar Contato</a></li>
					    </ul>
					    
					 </div>
					</div>
				
				</div>
				<div class="col-md-9">
					<div class="panel panel-primary">
					 <div class="panel-heading"><strong><img src="imagens/boy.png" height="24px" width="24px" style="margin-right: 24px;">Meus Contatos</strong></div>
					 <div class="panel-body">
					    <table class="table table-hover">
					    	<thead>
					    		<tr>
					    			<th>ID</th>
					    			<th>Nome:</th>
					    			<th>E-mail</th>
					    			<th></th>
					    			<th></th>
					    		</tr>
					    	</thead>
					    	
					    	<%for (Contato contato : listaContatos){%>
								<tr>
									<td><%=contato.getId() %>
									<td><%=contato.getNome() %>
									<td><%=contato.getEmail() %>
									<td><a href="editar_contato.jsp?id=<%=contato.getId()%>"><img src="imagens/add.png" height="24px" width="24px" style="margin-right: 24px;"></a>
									<td><a href="editar_contato.jsp?id=<%=contato.getId()%>"><img src="imagens/delete.png" height="24px" width="24px" style="margin-right: 24px;"></a>
								</tr>

					    	<%}%>


					    </table>
					    
					 </div>
					</div>
				
				</div>
			</div>
		</div>
		<!-- Rodapé da Página -->
		<footer>
		<div class="navbar navbar-default">
			<div class="row">
				<div class="col-md-12">
					<p><h3>& CelSoft - 2018</h3></p>
				</div>
			</div>
		</div>
		</footer>
		
		</body>
		</html>
	<%}%>