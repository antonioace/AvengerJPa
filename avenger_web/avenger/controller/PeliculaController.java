package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Clasificacion;
import entities.Pelicula;
import model.ClasificacionDAO;
import model.PeliculaDAO;

/**
 * Servlet implementation class PeliculaController
 */
@WebServlet("/PeliculaController/*")
public class PeliculaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private PeliculaDAO peliculaDAO;
       private ClasificacionDAO clasificacionDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeliculaController() {
    	
        
    	
    	super();
    	
    	
    	peliculaDAO =new PeliculaDAO();
    	clasificacionDAO=new ClasificacionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch (action) {
//		case "delete":
//			this.eliminarHeroe(request, response);
//			break;
		case "new":
		this.buscarPelicula(request, response);
		break;
		case "form":
			this.newForm(request, response);
			break;

		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch (action) {
		case "insert":
			this.guardarPelicula(request, response);
			break;
		case "update":
			this.actualizarPelicula(request, response);
			break;

		default:
			break;
		}
	}

	
	
	
//	 <tr>
//	    <th scope="col">id</th>
//	      <th scope="col">ano lanzamiento</th>
//	      <th scope="col">ano secuencia</th>
//	      <th scope="col">sinopsis</th>
//	      <th scope="col">Clasificacion</th>
	protected void guardarPelicula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		
		
		BigDecimal anolanzamiento=new BigDecimal(request.getParameter("anolanzamiento"));
		BigDecimal anosecuencia=new BigDecimal(request.getParameter("anosecuencia"));
		
		String sinopsis=request.getParameter("sinopsis");
		String clasificacion =request.getParameter("clasificacion");
		Clasificacion clasificacio= clasificacionDAO.find(clasificacion);
		String nombre=request.getParameter("nombre");
		Pelicula p=new Pelicula();
		p.setAnosecuencia(anosecuencia);
		p.setAnolanzamiento(anolanzamiento);
		p.setClasificacionBean(clasificacio);
		p.setSinopsis(sinopsis);
		p.setNombre(nombre);
	
		System.out.println(p.getId());
		peliculaDAO.insert(p);
		request.getRequestDispatcher("peliculaForm.jsp").forward(request, response);
		
		
		

	}
	protected void actualizarPelicula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
Integer id=Integer.parseInt(request.getParameter("id"));
		PeliculaDAO peliculaDAO=new PeliculaDAO();

		BigDecimal anolanzamiento=new BigDecimal(request.getParameter("anolanzamiento"));
		BigDecimal anosecuencia=new BigDecimal(request.getParameter("anosecuencia"));
		
		String sinopsis=request.getParameter("sinopsis");
		String clasificacion =request.getParameter("clasificacion");
		Clasificacion clasificacio= clasificacionDAO.find(clasificacion);
		String nombre=request.getParameter("nombre");
		Pelicula p=new Pelicula();
		p.setAnosecuencia(anosecuencia);
		p.setAnolanzamiento(anolanzamiento);
		p.setClasificacionBean(clasificacio);
		p.setSinopsis(sinopsis);
		p.setNombre(nombre);
	  p.setId(id);
		System.out.println(p.getId());
		peliculaDAO.update(p);
		request.getRequestDispatcher("peliculaForm.jsp").forward(request, response);
	}
	
	
	
	protected void buscarPelicula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Integer id=Integer.parseInt(request.getParameter("id"));
	Pelicula p=peliculaDAO.find(id);
	request.getSession().setAttribute("pelicula", p);
	
	request.getRequestDispatcher("peliculaForm.jsp").forward(request, response);
		

	}
	
	protected void newForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		request.getSession().setAttribute("pelicula", null);
		request.getRequestDispatcher("peliculaForm.jsp").forward(request, response);
			

		}

}
