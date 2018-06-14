package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.ContatoDao;
import br.senai.sp.jandira.modelo.Contato;

@WebServlet("/GravarContato")
public class GravarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GravarContato() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.print("gravar contato");
		
		Contato contato = new Contato();
		contato.setNome(request.getParameter("txtNome"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setDtNasc(request.getParameter("txtDtNasc"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setLogradouro(request.getParameter("txtLogradouro"));
		contato.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
		contato.setSexo(request.getParameter("cbSexo"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		
		ContatoDao contatoDao = new ContatoDao();
		contatoDao.setContato(contato);
		
		RequestDispatcher rd;
		
		if(contatoDao.gravarContatos()){
			rd = request.getRequestDispatcher("index.jsp");
		}else{
			rd = request.getRequestDispatcher("cadastrar_contato.jsp");
		}
		
		rd.forward(request, response);
	}

}
