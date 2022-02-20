/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcion;
import models.Pelicula;
import java.util.*;
/**
 *
 * @author juan pablo cano
 */
@WebServlet(name = "VerFuncion", urlPatterns = {"/VerFuncion"})
public class VerFuncion extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String peliculaHora =  request.getParameter("funcionDePelicula");
        String[] parts = peliculaHora.split("-");
        String nombrePelicula = parts[0];
        String hora = parts[1];
        Funcion funcion = Pelicula.buscarFuncion(Pelicula.buscarPelicula(nombrePelicula), hora);
        request.setAttribute("funcion", funcion);
        request.setAttribute("pelicula", funcion.getPelicula().getNombre());
        RequestDispatcher view = request.getRequestDispatcher("verFuncion.jsp");
        view.forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
