package model;

import util.Conexion;
import util.GenericDao;

import entities.Planeta;
public final class PlanetaDAO extends Conexion<Planeta> implements GenericDao<Planeta> {

	public PlanetaDAO() {
		// TODO Auto-generated constructor stub
		super(Planeta.class);
	}

}
