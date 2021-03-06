<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<html>
<head>        
    <title>SpringMVC</title> 	
    <LINK REL="stylesheet" TYPE="text/css" HREF="<%=request.getContextPath()%>/css/estilo.css">   
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">     
 </head> 
 
 <body>                                        

	<form:form action="consultaAlmacen.html" method="POST" commandName="almacenBeanFiltro">			
		<form:hidden path="idAlmacen" />
		<form:hidden path="nombreAlmacen" />
		<form:hidden path="telefono" />		
		<input class="btn btn-link" type="submit" value="Volver"/>
	</form:form>
	
	<div class="errorblock">
	 	<p><c:out value="${requestScope.mensajecreado}"/></p>
	 	<p><c:out value="${requestScope.crearUpdateMsg}"/></p>
 	</div>
 	<p><h1>Modifica Almacen</h1></p>
 	
	<form:form action="modificaAlmacen.html" method="POST" commandName="almacenBeanFiltro">
		<form:hidden path="idAlmacen" />
		<form:hidden path="nombreAlmacen" />
		<form:hidden path="telefono" />		
		<form:hidden path="idAlmacenEditar"/>
		<form:hidden  path="esActivo"/>		
		<table> 	 
			<tr>
				<th>ID:</th>
				<td><c:out value="${command.idAlmacen}"/>	</td>
			</tr>
			
			<tr>
				<th><form:label path="nombreAlmacenEditar">Nombre:</form:label></th>
				<td><form:input path="nombreAlmacenEditar" autofocus="autofocus"/></td>
			</tr>
			<tr>
				<th><form:label path="telefonoEditar">Teléfono:</form:label></th>
				<td><form:input path="telefonoEditar"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="Actualizar"/></td>
			</tr>
		</table>	
   </form:form>  
   <br>
	 		 <b>PRODUCTOS:</b>	
	 	<table class="table table-hover">	 		
	 		<tr>
	 			<th>ID</th><th>Producto</th><th>PVP</th><th>Editar</th><th>Eliminar</th>
	 		</tr>
			<c:forEach var="list" items="${command.productos}"> 
		 		<tr>		 			
		 			<td>
		 				<c:out value="${list.idProducto}"/>		
		 			</td>
		 			<td>
		 				<c:out value="${list.nombreProducto}"/>		
		 			</td>
		 			<td>
		 				<c:out value="${list.pvp}"/>		
		 			</td>
		 			<td>
		 				<c:if test="${empty almacenBeanFiltro.nombreAlmacen}">
						     <c:set var="nombre" scope="request" value="0"/>
						</c:if>
						<c:if test="${not empty almacenBeanFiltro.nombreAlmacen}">
						     <c:set var="nombre" scope="request" value="${almacenBeanFiltro.nombreAlmacen}"/>
						</c:if>
						<c:if test="${empty almacenBeanFiltro.telefono}">
						     <c:set var="telefono" scope="request" value="0"/>
						</c:if>
						<c:if test="${not empty almacenBeanFiltro.telefono}">
						     <c:set var="telefono" scope="request" value="${almacenBeanFiltro.telefono}"/>
						</c:if>
		 			
		 				<a class="" href="modificaProducto/${command.idAlmacen}/${list.idProducto}/<c:out value = "${almacenBeanFiltro.idAlmacen}" default="0"/>/<c:out value = "${nombre}"/>/<c:out value = "${telefono}"/>.html">
							<img src="img/modi2.png" border="1" height="23" >
						</a>
		 			</td>
		 			<td>
		 				<a href="borrarProducto.html?id=${list.idProducto}&idAlmacen=${command.idAlmacen}&idAlmacenBack=${almacenBeanFiltro.idAlmacen}&nombreAlmacenBack=${almacenBeanFiltro.nombreAlmacen}&telefonoBack=${almacenBeanFiltro.telefono}"><img src="img/eliminar.png" border="0" > </a>
		 			</td>
		 		</tr>
			</c:forEach>
			
			<tr>				
				<td colspan="5" align="right">									
					<a class="bordeRedondo" href="altaProducto/${command.idAlmacen}.html">Añadir Producto</a>
				</td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;</td>
			</tr>
	 	</table>
 </body> 
</html>