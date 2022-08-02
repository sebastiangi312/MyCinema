package controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;

@WebServlet(name = "PeliculasUsuario", urlPatterns = {"/PeliculasUsuario"})
public class PeliculasUsuario extends HttpServlet {

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
        String name = request.getParameter("pelibuscada");
        String age = request.getParameter("edad");
        String type = request.getParameter("genero");
        List<Pelicula> movies = Pelicula.pelis;

        if (!name.equals("")) {
            movies = movies.stream().filter(movie -> movie.getNombre().startsWith(name)).collect(Collectors.toList());
        }
        if (!age.equals("")) {
            movies = movies.stream().filter(movie -> movie.getEdad() == Integer.parseInt(age)).collect(Collectors.toList());
        }
        if (!type.equals("Todos")) {
            movies = movies.stream().filter(movie -> movie.getGenero().equals(type)).collect(Collectors.toList());
        }
        request.setAttribute("Pelis", movies);
        RequestDispatcher view = request.getRequestDispatcher("peliculasUsuario.jsp");
        view.forward(request, response);

    }

}
