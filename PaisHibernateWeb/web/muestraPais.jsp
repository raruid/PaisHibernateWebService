<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="pais" scope="request" class="Clases.Pais"/>
<jsp:setProperty name="pais" property="*"/>

<%
    Clases.Pais paisBean = (Clases.Pais) request.getAttribute("pais");
    if (paisBean == null) {
%>
ERROR: no se especific&oacute; sede a mostrar.
<%
} else {
    try  {
        Session s = Clases.HibernateUtil.getSessionFactory().openSession();
        s.refresh(paisBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pais <%=paisBean.getIdPais()%> - <%=paisBean.getNombre()%></title>
    </head>
    <body>
        <p>Pais <%=paisBean.getIdPais()%> - <%=paisBean.getNombre()%></p>
        <table border="1"><tr><td colspan="2" align="center">Datos del Pais</td></tr>
            <tr>
                <td>Nombre:</td>
                <td><%=paisBean.getNombre()%></td>
            </tr>
            <tr>
                <td>Zona_horaria:</td>
                <td><%=paisBean.getZonaHoraria()%></td>
            </tr>
            <tr>
                <td>Continente:</td>
                <td><%=paisBean.getContinente()%></td>
            </tr>
        </table>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>
