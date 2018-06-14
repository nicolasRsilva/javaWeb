
<%@page import="br.senai.sp.jandira.dao.ContatoDao"%>
<%@page import="br.senai.sp.jandira.modelo.Contato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
<%

	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	ArrayList<Contato>listaContatos = new ArrayList();

	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");

	if (u == null){
		response.sendRedirect("login.html");
	}else{ 
		ContatoDao c = new ContatoDao();
		
		Contato contato = new Contato();
		contato = c.getContato(Integer.parseInt(request.getParameter("id")));
		
		
		
		
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
					<div class="panel panel-success">
					<div class="panel-heading">
						<h3>Cadastro do Contato</h3>
					</div>
					<div class="panel-body">
						<!-- formulário de Cadastro -->
						<form method="Get" action="GravarContato">
							<fieldset>
								<legend>Dados Gerais:</legend>
								<!-- Linha 1 do formulario -->
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="hidden" name="txtIdUsuario" value="<%=u.getId()%>">
										<label for="txtNome">Nome:</label>
										<input type="text" name="txtNome" class="form-control" value="<%=contato.getNome()%>" />
									</div>
									<div class="form-group col-md-3">
										<label for="txtCidade">Dt.Nasc.:</label>
										<input type="date" name="txtDtNasc" class="form-control" value="<%=contato.getDtNasc()%>"/>
									</div>
									<div class="form-group col-md-3">
										<label for="cbSexo">sexo:</label>
										<select name="cbSexo" class="form-control">
											<option value="s" <%=contato.getSexo().equals("s")?"selected":""%>>Selecione</option>
											<option value="f" <%=contato.getSexo().equals("f")?"selected":""%>>Feminino</option>
											<option value="m" <%=contato.getSexo().equals("m")?"selected":""%>>Masculino</option>
										</select>
									</div>
								</div>
							</fieldset>
							<!-- Linha 2 do formulario -->
							<fieldset>
								<legend>Contato:</legend>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="txtEmail">E-mail:</label>
										<input type="email" name="txtEmail" class="form-control" value="<%=contato.getEmail()%>"/>
									</div>
									<div class="form-group col-md-3">
										<label for="txtTelefone">Telefone:</label>
										<input type="text" name="txtTelefone" class="form-control" value="<%=contato.getTelefone()%>"/>
									</div>
									<div class="form-group col-md-3">
										<label for="txtCelular">Celular:</label>
										<input type="text" name="txtCelular:" class="form-control" value="<%=contato.getCelular()%>"/>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend>Dados de Endereço:</legend>
								<!-- Linha 3 do formulario -->
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="txtBairro">Bairro:</label>
										<input type="text" name="txtBairro" class="form-control" value="<%=contato.getBairro()%>"/>
									</div>
									<div class="form-group col-md-8">
										<label for="txtLogradouro">Logradouro:</label>
										<input type="text" name="txtLogradouro" class="form-control" value="<%=contato.getLogradouro()%>"/>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="txtCidade">Cidade:</label>
										<input type="text" name="txtCidade" class="form-control" value="<%=contato.getCidade()%>"/>
									</div>
									<div class="form-group col-md-4">
										<label for="txtEstado">Estado:</label>
										<input type="text" name="txtEstado" class="form-control" value="<%=contato.getEstado()%>"/>
									</div>
									<div class="form-group col-md-4">
										<label for="txtCep">Cep:</label>
										<input type="text" name="txtCep" class="form-control" value="<%=contato.getCep()%>"/>
									</div>
								</div>
								
							</fieldset>
							<hr>
							<div class="form-row">
								<div class="col-md-12">
									<input type="submit" value="Salvar" class="btn btn-success"/>
									<input type="reset" value="Limpar Formulário" class="btn btn-warnig"/>
									<a href="login.html" class="btn btn-danger">Cancelar</a>
								</div>
							</div>
						</form>
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
					<p><h3>&copy; CelSoft - 2018</h3></p>
				</div>
			</div>
		</div>
		</footer>
		
		</body>
		</html>
	<%}%>