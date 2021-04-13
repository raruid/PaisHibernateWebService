<%-- 
    Document   : home
    Created on : 13-feb-2020, 13:11:01
    Author     : Usuario
--%>
<!-- home.jsp -->

<%@page import="java.util.List" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Query" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="frm_muestra_pais" method="post" action="controlador">
            <input type="hidden" name="op" value="muestraPais">
            <input type="hidden" name="idPais">
            <table border="1">
                <tr><td colspan="2" align="centre">Paises[<a href="javascript:void(0)" onclick="javascript:document.
                            frm_muestra_pais.op.value = 'altaPais';document.frm_muestra_pais.
                            submit();">Dar de alta un Pais</a>]</td></tr>              
                
                <% 
                    Session s = Clases.HibernateUtil.getSessionFactory().openSession();
                try{
                    Query q = s.createQuery("FROM Pais ORDER BY nombre, id_pais").setReadOnly(true);
                    List<Clases.Pais> listaPaises = (List<Clases.Pais>) q.list();
                    if(listaPaises.isEmpty()){%>
                        <tr><td colspan = "2">No existen paises</td></tr>
                        <%
                    }else{
                        for(Clases.Pais unPais: listaPaises){%>
                            <tr>
                                <td><%=unPais.getIdPais()%></td>
                                <td><a href="javascript:void(0)" 
                                        onclick="javascript:document.
                                        frm_muestra_pais.idPais.value = '<%=unPais.getIdPais()%>';
                                document.frm_muestra_pais.submit();"><%=unPais.getNombre()%></a></td>
                                <td><a href="javascript:void(0)" 
                                        onclick="javascript:document.
                                        frm_muestra_pais.idPais.value = '<%=unPais.getIdPais()%>';
                                        javascript:document.
                                        frm_muestra_pais.op.value = 'upPais';
                                document.frm_muestra_pais.submit();">Editar</a></td>
                                <td><a href="javascript:void(0)" 
                                        onclick="javascript:document.
                                        frm_muestra_pais.idPais.value = '<%=unPais.getIdPais()%>';
                                        javascript:document.
                                        frm_muestra_pais.op.value = 'borrarPais';
                                document.frm_muestra_pais.submit();">Eliminar</a></td>
                            </tr>
                            <%
                        }
                    }
                }catch(Exception e){
                    e.printStackTrace(System.err);
                }
                %>
            </table>
            
        </form>
    </body>
</html>
