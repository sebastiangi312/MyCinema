
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;

@WebServlet(name = "VotarPeliculax", urlPatterns = {"/VotarPeliculax"})
public class VotarPeliculax extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("pelicula") != null) {
            Pelicula pelicula = Pelicula.buscarPelicula(request.getParameter("pelicula"));
            request.setAttribute("pelicula", pelicula);
        }
        RequestDispatcher view = request.getRequestDispatcher("votarPeliculax.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula pelicula = Pelicula.buscarPelicula(request.getParameter("pelicula"));
        int voto = Integer.parseInt(request.getParameter("voto"));
        pelicula.getVotos().add(voto);
        pelicula.setPuntuacion(pelicula.calcularVotos(pelicula.getVotos()));
        request.setAttribute("pelicula", pelicula);
        
        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request, response);

    }
}
