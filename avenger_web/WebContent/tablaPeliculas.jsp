<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean class="model.PeliculaDAO" id = "peliculaDAO" ></jsp:useBean> 
<jsp:useBean class="model.GeneroDAO" id = "generoDAO" ></jsp:useBean>
<jsp:useBean class="model.EstadoDAO" id = "estadoDAO" ></jsp:useBean>
  <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="" class="navbar-brand"> Administracion de avengers</a>
                    </div>

                    
                </nav>
            </header>

<h1><b>peliculas</b></h1>
  	<table class="table">
  <thead>
    <tr>
    <th scope="col">id</th>
      <th scope="col">ano lanzamiento</th>
      <th scope="col">nombre</th>
       <th scope="col">ano secuencia</th>
      <th scope="col">sinopsis</th>
      <th scope="col">Clasificacion</th>
     
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${peliculaDAO.list()}" var = "pelicula" >
    <tr>
      <th scope="row"><c:out value="${pelicula.id}" /></th>
      <td><c:out value="${pelicula.anolanzamiento}" /></td>
      <td><c:out value="${pelicula.nombre}" /></td>
   <%--    <td><c:out value="${pelicula.descripcion}" /></td> --%>
      <%--   <td><c:out value="${empleado.fechaingreso}" /></td> --%>
       <td><c:out value="${pelicula.anosecuencia}" /></td>
          <td><c:out value="${pelicula.sinopsis}" /></td>
            <td><c:out value="${pelicula.clasificacionBean.getDescripcion()}" /></td>
                  
     <%--  <input type="hidden" value="<c:out value="${empleado.codigo}" />" class="form-control" name="codigo" required="required"> --%>
     <%--  <td><a href="eliminar?&codigo=${empleado.codigo}">Eliminar</a></td> --%>
      <td><a href="PeliculaController?action=new&id=${pelicula.id }">Editar</a>  <a href="peliculaController?action=delete&id=${pelicula.id}">Elminar</a></td>
    </tr>
 </c:forEach>
  </tbody>
</table>

<a href="PeliculaController?action=form" class="btn btn-primary">Agregar</a> 

</body>
</html>