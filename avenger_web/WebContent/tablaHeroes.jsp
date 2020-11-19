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
<jsp:useBean class="model.HeroeDAO" id = "heroeDAO" ></jsp:useBean> 
<jsp:useBean class="model.GeneroDAO" id = "generoDAO" ></jsp:useBean>
<jsp:useBean class="model.EstadoDAO" id = "estadoDAO" ></jsp:useBean>
  <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="" class="navbar-brand"> Administracion de avengers</a>
                    </div>

                    
                </nav>
            </header>

<h1><b>Heroes</b></h1>
  	<table class="table">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">arma</th>
      <th scope="col">descripcion</th>
      <th scope="col">fecha aparicion</th>
      <th scope="col">fecha nacimiento</th>
      <th scope="col">heroe</th>
        <th scope="col">nombre</th>
          <th scope="col">genero</th>
            <th scope="col">descripcion</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${heroeDAO.list()}" var = "heroe" >
    <tr>
      <th scope="row"><c:out value="${heroe.id}" /></th>
      <td><c:out value="${heroe.arma}" /></td>
         <td><c:out value="${heroe.descripcion}" /></td>
   <%--    <td><c:out value="${heroe.descripcion}" /></td> --%>
      <%--   <td><c:out value="${empleado.fechaingreso}" /></td> --%>
       <td><c:out value="${heroe.fechaaparicion}" /></td>
          <td><c:out value="${heroe.fechanacimiento}" /></td>
            <td><c:out value="${heroe.heroe}" /></td>
                   <td><c:out value="${heroe.nombre}" /></td>
                    <td><c:out value="${heroe.estadoBean.getDescripcion()}" /></td> 
                        <td><c:out value="${heroe.generoBean.getDescripcion()}" /></td> 
     <%--  <input type="hidden" value="<c:out value="${empleado.codigo}" />" class="form-control" name="codigo" required="required"> --%>
     <%--  <td><a href="eliminar?&codigo=${empleado.codigo}">Eliminar</a></td> --%>
      <td><a href="HeroeController?action=new&id=${heroe.id }">Editar</a>  <a href="HeroeController?action=delete&id=${heroe.id}">Elminar</a></td>
    </tr>
 </c:forEach>
  </tbody>
</table>

<a href="HeroeController?action=show"  class="btn btn-primary"> AgregarHeroe</a> 

</body>
</html>