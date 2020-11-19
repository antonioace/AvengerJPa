package model;
import entities.Genero;
import util.Conexion;
import util.GenericDao;

public class GeneroDAO extends Conexion<Genero> implements GenericDao<Genero> {

	
	public GeneroDAO() {
		// TODO Auto-generated constructor stub
		super(Genero.class);
	}


}
