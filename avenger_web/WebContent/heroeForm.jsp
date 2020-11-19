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
	<jsp:useBean class="model.EstadoDAO" id="estadoDAO"></jsp:useBean>
	<jsp:useBean class="model.HeroeDAO" id="heroeDAO"></jsp:useBean>
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
				<c:if test="${heroe != null}">
					<%--  <form action="${pageContext.request.contextPath}/ActualizarEmpleado?accion=edita&codigo=${empleado.codigo}"  method="post"> --%>
					<form action="HeroeController?action=update&id=${heroe.id}" method="POST">
				</c:if>
				<c:if test="${heroe == null}">
					<%--  <form action="${pageContext.request.contextPath}/AgregarEmpleado?accion=agregar&codigo=${empleado.codigo}"  method="POST"> --%>
					<form action="HeroeController?action=insert" method="POST">
				</c:if>

				<caption>
					<h2>Registro Heroe</h2>
				</caption>




				<fieldset class="form-group">
					<label>arma</label> <input type="text"
						value="<c:out value='${heroe.arma}' />" class="form-control"
						name="arma">
				</fieldset>
				
				
				<fieldset class="form-group">
					<label>Nombre</label> <input type="text"
						value="<c:out value='${heroe.nombre}' />" class="form-control"
						name="nombre">
				</fieldset>
				
				
				<fieldset class="form-group">
					<label>Descripcion</label> <input type="text"
						value="<c:out value='${heroe.descripcion}' />" class="form-control"
						name="descripcion">
				</fieldset>

				<fieldset class="form-group">
					<label>Fecha aparicion</label> <input type="date"
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${heroe.fechaaparicion}' />"
						class="form-control" name="fechaaparicion">

				</fieldset>


				<fieldset class="form-group">
					<label>Fecha Nacimiento</label> <input type="date"
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${heroe.fechanacimiento}' />"
						class="form-control" name="fechanacimiento">
				</fieldset>

				<fieldset class="form-group">
					<label>Heroe</label> <input type="text"
						value="<c:out value='${heroe.heroe}' />" class="form-control"
						name="heroe">
				</fieldset>



				
				
				
				
				<fieldset class="form-group">
					<label>Estado</label> 
					<select class="form-control" id="exampleFormControlSelect1" name="estado">
		   <c:forEach items="${estadoDAO.list() }" var="estado">
  
				<option value="${estado.id}" >
         <c:out value="${estado.descripcion} "/>
         </option>
			
				
				
         </c:forEach>

      
    </select>	
					
				</fieldset>



				<fieldset class="form-group">
					<label>genero</label>
					   <select class="form-control" id="exampleFormControlSelect1" name="genero" >
					   
					   
					     <option selected> <c:out value="${heroe.generoBean.getDescripcion()} "/>   </option >
   <c:forEach items="${generoDAO.list()}" var="genero">
   
         <option value="${genero.id} " >
         <c:out value="${genero.descripcion} "/>
         
         </option></c:forEach>

      
    </select>
				</fieldset>




    
	


				<button type="submit" class="btn btn-success">Registrar</button>
				<a href="${pageContext.request.contextPath}/tablaHeroes.jsp"
					class="btn btn-primary">Volver</a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>