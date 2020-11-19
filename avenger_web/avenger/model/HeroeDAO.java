package model;

import entities.Heroe;
import util.Conexion;
import util.GenericDao;
public class HeroeDAO extends Conexion<Heroe> implements GenericDao<Heroe>{
	
	public HeroeDAO() {
		// TODO Auto-generated constructor stub
		super(Heroe.class);
	}
	
	

}
