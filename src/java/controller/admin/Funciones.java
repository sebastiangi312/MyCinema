package controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Funcion;
import models.Pelicula;
import models.Sala;

@WebServlet(name = "Funciones", urlPatterns = {"/Funciones"})
public class Funciones extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("funciones_", Funcion.getFunciones());
        request.setAttribute("Pelis", Pelicula.pelis);
        request.setAttribute("Salas", Sala.listaSala);

        RequestDispatcher view = request.getRequestDispatcher("funciones.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pelicula movie = Pelicula.buscarPelicula(request.getParameter("pelicula"));
        Sala room = Sala.buscarSala(Integer.parseInt(request.getParameter("numSala")));
        String hour = request.getParameter("horaDeFuncion");
        String format = request.getParameter("formato");
        
        boolean isCrossing = false;
        for (Funcion funcion : movie.getFunciones()) {
            if (funcion.getHoraDeFuncion().equals(hour)) {
                isCrossing = true;
            }
        }
        if (!isCrossing) {
            Funcion showTime = new Funcion(movie, room, hour, format);
        }

        request.setAttribute("funciones_", Funcion.getFunciones());
        request.setAttribute("Pelis", Pelicula.pelis);
        request.setAttribute("Salas", Sala.listaSala);
        RequestDispatcher view = request.getRequestDispatcher("funciones.jsp");
        view.forward(request, response);
    }
}
