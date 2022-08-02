
package controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;

@WebServlet(name = "VotarPeliculas", urlPatterns = {"/VotarPeliculas"})
public class VotarPeliculas extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("Pelis", Pelicula.pelis);
        RequestDispatcher view = request.getRequestDispatcher("votarPeliculas.jsp");
        view.forward(request, response);
        
        
    }
}
