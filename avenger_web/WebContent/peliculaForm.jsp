<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean class="model.GeneroDAO" id="generoDAO"></jsp:useBean>
	<jsp:useBean class="model.ClasificacionDAO" id="clasificacionDAO"></jsp:useBean>
	<jsp:useBean class="model.PeliculaDAO" id="peliculaDAO"></jsp:useBean>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="" class="navbar-brand"> Administracion de avengers</a>
			</div>


		</nav>
	</header>


	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${pelicula != null}">
					<%--  <form action="${pageContext.request.contextPath}/ActualizarEmpleado?accion=edita&codigo=${empleado.codigo}"  method="post"> --%>
					<form action="PeliculaController?action=update"method="POST">
				</c:if>
				<c:if test="${pelicula == null}">
					<%--  <form action="${pageContext.request.contextPath}/AgregarEmpleado?accion=agregar&codigo=${empleado.codigo}"  method="POST"> --%>
					<form action="PeliculaController?action=insert" method="POST">
				</c:if>

				<caption>
					<h2>Registro pelicula</h2>
				</caption>


	<fieldset class="form-group">
					<label>Id</label> <input type="text"
						value="<c:out value='${pelicula.id}' />" class="form-control"
						name="id">
				</fieldset>

				
				<fieldset class="form-group">
					<label>Anio lanzamiento</label> <input type="text"
						value="<c:out value='${pelicula.anolanzamiento}' />" class="form-control"
						name="anolanzamiento">
				</fieldset>
				
				
				
<fieldset class="form-group">
					<label>Anio secuencia</label> <input type="text"
						value="<c:out value='${pelicula.anosecuencia}' />" class="form-control"
						name="anosecuencia">
				</fieldset>
				
				
				<label>Sinopsis</label> <input type="text"
						value="<c:out value='${pelicula.sinopsis}' />" class="form-control"
						name="sinopsis">
				</fieldset>
				
				
				
				<label>Nombre</label> <input type="text"
						value="<c:out value='${pelicula.nombre}' />" class="form-control"
						name="nombre">
				</fieldset>
					
				<label>Clasificacion</label> <input type="text"
						value="<c:out value='${pelicula.clasificacionBean.getId()}' />" class="form-control"
						name="clasificacion">
				</fieldset>
				


			



				<button type="submit" class="btn btn-success">Registrar</button>
				<a href="${pageContext.request.contextPath}/tablaPeliculas.jsp"
					class="btn btn-primary">Volver</a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>