
package controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Factura;
import models.Pelicula;
import models.Persona;


@WebServlet(name = "Datos", urlPatterns = {"/Datos"})
public class Datos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setMostAndLeastViewed(request);
        setBestAndWorstRated(request);
        RequestDispatcher view = request.getRequestDispatcher("datos.jsp");
        view.forward(request, response);
    }
    
    private void setMostAndLeastViewed(HttpServletRequest request){
        HttpSession session = request.getSession();
        Pelicula mostViewMovie = Pelicula.pelis.get(0);
        Pelicula leastViewMovie = Pelicula.pelis.get(0);
        for (Pelicula movie : Pelicula.pelis) {
            if (mostViewMovie.getAsistencia() < movie.getAsistencia()){
               mostViewMovie = movie;
            }
            if (leastViewMovie.getAsistencia() > movie.getAsistencia()){
               leastViewMovie = movie;
            }
        }
        
        session.setAttribute("AsisMinima", leastViewMovie.getAsistencia());
        session.setAttribute("PAsisMinima", leastViewMovie);
        session.setAttribute("AsisMaxima", mostViewMovie.getAsistencia());
        session.setAttribute("PAsisMaxima", mostViewMovie);
    }
    
    private void setBestAndWorstRated(HttpServletRequest request){
        HttpSession session = request.getSession();
        Pelicula bestRatedMovie = Pelicula.pelis.get(0);
        Pelicula worstRatedMovie = Pelicula.pelis.get(0);
        for (Pelicula movie : Pelicula.pelis) {
            if (bestRatedMovie.getPuntuacion() < movie.getPuntuacion()) {
                bestRatedMovie = movie;
            }
            if(worstRatedMovie.getPuntuacion() > movie.getPuntuacion()){
                worstRatedMovie = movie;
            }
        }
        session.setAttribute("valMinima",worstRatedMovie.getPuntuacion());
        session.setAttribute("PVMinima",worstRatedMovie);
        session.setAttribute("valMaxima",bestRatedMovie.getPuntuacion());
        session.setAttribute("PVMaxima",bestRatedMovie);
    }
}
