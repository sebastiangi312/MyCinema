
package controller.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcion;
import models.Pelicula;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(name = "VerFuncion", urlPatterns = {"/VerFuncion"})
public class VerFuncion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Funcion showTime = getShowTime(request);
        List<Funcion> showTimes =  Funcion.getFunciones().stream().filter(i -> i.getHoraDeFuncion().equals(showTime.getHoraDeFuncion()))
                                                                  .collect(Collectors.toList());
        request.setAttribute("funcion", showTime);
        request.setAttribute("funciones", showTimes);
        request.setAttribute("pelicula", showTime.getPelicula().getNombre());
        RequestDispatcher view = request.getRequestDispatcher("verFuncion.jsp");
        view.forward(request, response);
    }

    private Funcion getShowTime(HttpServletRequest request){
        String peliculaHora =  request.getParameter("funcionDePelicula");
        String[] parts = peliculaHora.split("-");
        String nombrePelicula = parts[0];
        String hora = parts[1];
        return Pelicula.buscarFuncion(Pelicula.buscarPelicula(nombrePelicula), hora);
    }
}
