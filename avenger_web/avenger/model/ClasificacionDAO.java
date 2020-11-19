package model;
import util.Conexion;
import util.GenericDao;
import entities.Clasificacion;

public class ClasificacionDAO  extends Conexion<Clasificacion> implements GenericDao<Clasificacion>{

	
	
	public ClasificacionDAO() {
		// TODO Auto-generated constructor stub
		super(Clasificacion.class);
	}
	
}
