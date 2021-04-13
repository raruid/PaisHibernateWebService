/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Clases.Pais;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String oper = request.getParameter("op");
        if(oper == null){
            oper = "";
        }
        
        RequestDispatcher rd;
        
        switch(oper){
            case "altaPais":
                response.sendRedirect("frmNuevoPais.jsp");
                break;
            case "insertPais":
                rd = request.getRequestDispatcher("procNuevoPais.jsp");
                rd.forward(request, response);
                break;
            case "muestraPais":
                rd = request.getRequestDispatcher("muestraPais.jsp");
                rd.forward(request, response);
                break;
            case "upPais":
                rd = request.getRequestDispatcher("frmUpdatePais.jsp");
                rd.forward(request, response);
                break;       
            case "updatePais": 
                
                String idPais2 = request.getParameter("idPais");
                String nombre = request.getParameter("nombre");
                String zona = request.getParameter("zonaHoraria");
                String continente = request.getParameter("continente");
                
                Clases.Pais pais2 = new Clases.Pais();
                
                Session s2 = Clases.HibernateUtil.getSessionFactory().openSession();
                
                s2.beginTransaction();
                pais2.setIdPais(Integer.parseInt(idPais2));
                pais2.setNombre(nombre);
                pais2.setZonaHoraria(zona);
                pais2.setContinente(continente);
                
                s2.saveOrUpdate(pais2);
                s2.getTransaction().commit();
                s2.close();
                
                response.sendRedirect("home.jsp");                
                
                break;          
            case "borrarPais":
                int idPais = Integer.parseInt(request.getParameter("idPais"));
                
                Clases.Pais pais = new Clases.Pais();
                
                Session s = Clases.HibernateUtil.getSessionFactory().openSession();
                
                s.beginTransaction();
                pais.setIdPais(idPais);
                s.delete(pais);
                s.getTransaction().commit();
                s.close();
                
                response.sendRedirect("home.jsp");
                break;                
            default:
                response.sendRedirect("home.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
