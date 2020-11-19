package model;

import util.Conexion;
import util.GenericDao;
import entities.Clasificacion;
import entities.Estado;
public class EstadoDAO extends Conexion<Estado> implements GenericDao<Estado> {


	public EstadoDAO() {
		// TODO Auto-generated constructor stub
		super(Estado.class);
	}
	
}
