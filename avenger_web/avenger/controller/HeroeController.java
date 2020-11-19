package controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Estado;
import entities.Genero;
import entities.Heroe;
import model.EstadoDAO;
import model.GeneroDAO;
import model.HeroeDAO;

/**
 * Servlet implementation class HeroeController
 */
@WebServlet("/HeroeController/*")
public class HeroeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HeroeDAO heroeDAO;
	private GeneroDAO generoDAO;
	private EstadoDAO estadoDAO;    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeroeController() {
        super();
        heroeDAO=new HeroeDAO();
        generoDAO=new GeneroDAO();
        estadoDAO=new EstadoDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		switch (action) {
		case "delete":
			this.EliminarHeroe(request, response);
			break;
		case "new":
			this.buscarHeroe(request, response);
			break;
		case "show":
			this.showHeroe(request, response);
			break;

		default:
			break;
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		switch (action) {
		case "update":
			this.ActualizarHeroe(request, response);
			break;
		case "insert":
			this.AgregarHeroePelicula(request, response);
			break;
		
		

		default:
			break;
		}
	
	}
	 
		protected void showHeroe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     request.getSession().setAttribute("heroe", null);
	     request.getRequestDispatcher("heroeForm.jsp").forward(request, response);
	
		}
		
		
		protected void buscarHeroe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			int id = Integer.parseInt(request.getParameter("id"));
			Heroe heroe = heroeDAO.find(id);
			
			request.getSession().setAttribute("heroe", heroe);
			request.getRequestDispatcher("heroeForm.jsp").forward(request, response);;
		}
		
		protected void EliminarHeroe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("id"));
			
			Heroe heroe = heroeDAO.find(id);
			heroeDAO.delete(heroe);
//			response.sendRedirect("tablaHeroes.jsp");
			request.getRequestDispatcher("tablaHeroes.jsp").forward(request, response);
		}
		
		
//	    <th scope="col">id</th>
//	      <th scope="col">arma</th>
//	      <th scope="col">descripcion</th>
//	      <th scope="col">fecha aparicion</th>
//	      <th scope="col">fecha nacimiento</th>
//	      <th scope="col">heroe</th>
//	        <th scope="col">nombre</th>
//	          <th scope="col">genero</th>
//	            <th scope="col">descripcion</th>
		protected void ActualizarHeroe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			
			int id = Integer.parseInt(request.getParameter("id"));
			String arma=request.getParameter("arma");
			String descripcion=request.getParameter("descripcion");
			String heroe=request.getParameter("heroe");
			String nombre=request.getParameter("nombre");
			String estado=request.getParameter("estado");
			String genero=request.getParameter("genero");
			Heroe heroe1=new Heroe();
			try {
				Date fechaparicion=(Date) sd.parse(request.getParameter("fechaaparicion"));
				Date fechanacimiento=(Date) sd.parse(request.getParameter("fechanacimiento"));
				heroe1.setFechaaparicion(fechaparicion);
				heroe1.setFechanacimiento(fechanacimiento);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		Estado estado1=estadoDAO.find(estado);
		Genero genero1=generoDAO.find(genero);
		
		heroe1.setArma(arma);
		heroe1.setDescripcion(descripcion);
		heroe1.setEstadoBean(estado1);
		heroe1.setGeneroBean(genero1);
		heroe1.setId(id);
		heroe1.setNombre(nombre);
		heroe1.setHeroe(heroe);
		
		
		heroeDAO.update(heroe1);
		
		request.getRequestDispatcher("tablaHeroes.jsp").forward(request, response);
	
		}
		
		protected void AgregarHeroePelicula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			
			
			String arma=request.getParameter("arma");
			String descripcion=request.getParameter("descripcion");
			String heroe=request.getParameter("heroe");
			String nombre=request.getParameter("nombre");
			String estado=request.getParameter("estado");
			String genero=request.getParameter("genero");
			Heroe heroe1=new Heroe();
//			try {
//				Date fechaparicion=(Date) sd.parse(request.getParameter("fechaaparicion"));
//				Date fechanacimiento=(Date) sd.parse(request.getParameter("fechanacimiento"));
//				heroe1.setFechaaparicion(fechaparicion);
//				heroe1.setFechanacimiento(fechanacimiento);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			Date fechaparicion;
			try {
				fechaparicion = (Date) sd.parse(request.getParameter("fechaaparicion"));
				heroe1.setFechaaparicion(fechaparicion);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date fechanacimiento;
			try {
				fechanacimiento = (Date) sd.parse(request.getParameter("fechanacimiento"));
				heroe1.setFechanacimiento(fechanacimiento);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		Estado estado1=estadoDAO.find(estado);
		Genero genero1=generoDAO.find(genero);
		
		heroe1.setArma(arma);
		heroe1.setDescripcion(descripcion);
		heroe1.setEstadoBean(estado1);
		heroe1.setGeneroBean(genero1);
		
		heroe1.setNombre(nombre);
		heroe1.setHeroe(heroe);
		
		
		heroeDAO.insert(heroe1);
		
		request.getRequestDispatcher("tablaHeroes.jsp").forward(request, response);
	
		}
	
	
	

}
