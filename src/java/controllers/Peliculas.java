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
import models.Pelicula;
import models.Persona;

/**
 *
 * @author juan pablo cano
 */
@WebServlet(urlPatterns = {"/Peliculas"})
public class Peliculas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        List<Pelicula> Pelis = Pelicula.pelis;
        request.setAttribute("Pelis", Pelis);
        RequestDispatcher view = request.getRequestDispatcher("peliculas.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pelicula> Pelis = Pelicula.pelis;
        String name = request.getParameter("name");
        String genero = request.getParameter("genero");
        int edad = Integer.parseInt(request.getParameter("edad"));
        Pelicula p = new Pelicula(name,genero,edad);
        request.setAttribute("Pelis", Pelis);        
        RequestDispatcher view = request.getRequestDispatcher("peliculas.jsp");
        view.forward(request, response);
    }
}
    