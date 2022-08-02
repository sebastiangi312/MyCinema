
package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;

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
        String type = request.getParameter("genero");
        int age = Integer.parseInt(request.getParameter("edad"));
        Pelicula movie = new Pelicula(name,type,age);
        request.setAttribute("Pelis", Pelis);        
        RequestDispatcher view = request.getRequestDispatcher("peliculas.jsp");
        view.forward(request, response);
    }
}
    