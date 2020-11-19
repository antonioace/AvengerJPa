package model;

import entities.Pelicula;
import util.Conexion;
import util.GenericDao;
public class PeliculaDAO  extends Conexion<Pelicula> implements GenericDao<Pelicula>{
	public PeliculaDAO() {
		// TODO Auto-generated constructor stub
		super(Pelicula.class);
	}
}
