<%-- 
    Document   : frmNuevaSede
    Created on : 18-feb-2020, 10:18:30
    Author     : Charlowit
--%>

<%@page import="Clases.Pais"%>
<!-- frmNuevaSede.jsp --> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="pais" scope="request" class="Clases.Pais"/> 
<jsp:setProperty name="pais" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="ContentType" content="text/html; charset=UTF-8"> 
		<title>Alta de Pais</title> 
	</head>
	<body> 
		<form method="post" action="controlador"> 
			<table> 
				<tr> 
					<td> 
						<input type="hidden" name="op" value="updatePais"/>
                                                <input name="idPais" value="<%=request.getParameter("idPais")%>" type="hidden"/> 
                                                <hr>Nuevo nombre</hr>
						<input name="nombre" required type="text" size="20"  maxlength="20"/> 
                                                <hr>Zona Horaria</hr>
						<input name="zonaHoraria" required type="text" size="20"  maxlength="20"/> 
                                                <hr>Continente </hr>
						<input name="continente" required type="text" size="20"  maxlength="20"/> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<input type="submit" value="Modificar"/> 
						<input type="reset" name="cancelar" value="Cancelar"/> 
					</td> 
				</tr> 
			</table> 
		</form> 
		<a href="controlador">Inicio</a> 
	</body> 
</html> 