/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Funcion;
import models.Pelicula;

/**
 *
 * @author juan pablo cano
 */
@WebServlet(name = "PeliculasUsuario", urlPatterns = {"/PeliculasUsuario"})
public class PeliculasUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("Pelis", Pelicula.pelis);
        RequestDispatcher view = request.getRequestDispatcher("peliculasUsuario.jsp");
        view.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("pelibuscada");
        String edad = request.getParameter("edad");
        String genero = request.getParameter("genero");
        ArrayList<Pelicula> peli = new ArrayList<>();
        Pelicula pelicula = Pelicula.buscarPelicula(nombre);
        if (pelicula != null) {
            if (!genero.equals("Todos")) {
                if (!edad.equals("")) {
                    if (pelicula.getGenero().equals(genero) && pelicula.getEdad() == Integer.parseInt(edad)) {
                        peli.add(pelicula);
                    }
                } else {
                    if (pelicula.getGenero().equals(genero)) {
                        peli.add(pelicula);
                    }
                }
            } else {
                if (!edad.equals("")) {
                    if (pelicula.getEdad() == Integer.parseInt(edad)) {
                        peli.add(pelicula);
                    }
                } else {
                    peli.add(pelicula);
                }
            }
        } else if (nombre.equals("")) {
            if (!genero.equals("Todos")) {
                if (!edad.equals("")) {
                    for (Pelicula peliculaAux : Pelicula.pelis) {
                        if (peliculaAux.getEdad() == Integer.parseInt(edad) && peliculaAux.getGenero().equals(genero)) {
                            peli.add(peliculaAux);
                        }
                    }
                } else {
                    for (Pelicula peliculaAux : Pelicula.pelis) {
                        if (peliculaAux.getGenero().equals(genero)) {
                            peli.add(peliculaAux);
                        }
                    }
                }
            } else {
                if (!edad.equals("")) {
                    for (Pelicula peliculaAux : Pelicula.pelis) {
                        if (peliculaAux.getEdad() == Integer.parseInt(edad)) {
                            peli.add(peliculaAux);
                        }
                    }
                } else {
                    peli = Pelicula.pelis;
                }
            }
        }
        request.setAttribute("Pelis", peli);
        RequestDispatcher view = request.getRequestDispatcher("peliculasUsuario.jsp");
        view.forward(request, response);

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
