<%@page import="Clases.HibernateUtil"%>
<%@page import="Clases.Pais"%>
<!-- // procNuevaSede.jsp --> 
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="org.hibernate.Query"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="pais" scope="request" class="Clases.Pais"/> 
<jsp:setProperty name="pais" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Creación de paises</title> 
	</head> 
	<body> 
		<% 
			Pais paisBean = (Pais) request.getAttribute("pais");
			if (paisBean == null) { 
		%> 
			ERROR: no se proporcionaron datos de pais para crear.
		<% } 
			else { 
				Transaction t = null; 
                                Session s;
				try { 
                                        s = HibernateUtil.getSessionFactory().openSession();
					t = s.beginTransaction(); 
					s.save(paisBean); 
					t.commit(); 
					%>
					Creada nuevo pais: [<%=paisBean.getIdPais()%>] <%=paisBean.getNombre()%><br/> 
					<a href="controlador">Volver</a> 
				<% } 
				catch (Exception e) { 
				e.printStackTrace(System.err); 
				if (t != null) { 
					t.rollback(); 
				}
			} 
		} %> 
	</body> 
</html> 
