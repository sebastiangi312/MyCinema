package controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;

@WebServlet(name = "VerPelicula", urlPatterns = {"/VerPelicula"})
public class VerPelicula extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("pelicula") != null) {
            Pelicula pelicula = Pelicula.buscarPelicula(request.getParameter("pelicula"));
            pelicula.setPuntuacion(pelicula.calcularVotos(pelicula.getVotos()));
            request.setAttribute("pelicula", pelicula);
        }
        RequestDispatcher view = request.getRequestDispatcher("verPelicula.jsp");
        view.forward(request, response);
    }
}
