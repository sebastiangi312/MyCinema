/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;

/**
 *
 * @author juan pablo cano
 */
@WebServlet(name = "Comprar", urlPatterns = {"/Comprar"})
public class Comprar extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String peliculaHora = request.getParameter("funcion");
        String[] parts = peliculaHora.split("-");
        String nombrePelicula = parts[0];
        String hora = parts[1];
        Funcion funcion = Pelicula.buscarFuncion(Pelicula.buscarPelicula(nombrePelicula), hora);
        ArrayList<ArrayList<Tiquete>> multiArreglo = new ArrayList<>();
        int size = funcion.getListaTiquetes().size() / 10;
        for (int i = 0; i < size; i++) {
            multiArreglo.add(new ArrayList<Tiquete>());
        }
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < 10; j++) {
                Tiquete tiquete = (Tiquete) funcion.getListaTiquetes().get(j + i * 10);
                multiArreglo.get(i).add(tiquete);
            }
        }
        request.setAttribute("multiArreglo", multiArreglo);
        request.setAttribute("peliculaHora", peliculaHora);
        request.setAttribute("sillasDisponibles", funcion.getSillasDisponibles());
        RequestDispatcher view = request.getRequestDispatcher("comprar.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String peliculaHora = request.getParameter("funcion");
        String[] parts = peliculaHora.split("-");
        String nombrePelicula = parts[0];
        String hora = parts[1];
        Funcion funcion = Pelicula.buscarFuncion(Pelicula.buscarPelicula(nombrePelicula), hora);
        LinkedList<Integer> tiquetesComprados = new LinkedList<>();
        for (int i = 1; i <= funcion.getSala().getCantidadSillas(); i++) {
            if (request.getParameter(String.valueOf(i)) != null) {
                tiquetesComprados.add(Integer.parseInt(request.getParameter(String.valueOf(i))));

            }
        }
        Persona p = (Persona) session.getAttribute("aPersona");

        Factura factura = new Factura(p.getNombre().concat(" " + p.getApellido()));
        for (int numeroSilla : tiquetesComprados) {
            Tiquete tiquete = funcion.buscarTiquete(numeroSilla);

            if (tiquete != null) {
                factura.agregarTiquete(tiquete);
                funcion.getSillasDisponibles().remove(funcion.getSillasDisponibles().indexOf(tiquete.getSilla()));
            }
        }
        p.compraRealizada(factura.getPrecio());
        Persona MayorD = p.mayorDinero(p);
        request.setAttribute("sillasDisponibles", funcion.getSillasDisponibles());
        request.setAttribute("factura", factura);
        session.setAttribute("factura", factura);
        if (MayorD != null) {
            session.setAttribute("MayorD", MayorD);
        }
        session.setAttribute("tiquetesComprados", tiquetesComprados);
        RequestDispatcher view = request.getRequestDispatcher("factura.jsp");
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
