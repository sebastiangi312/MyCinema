package controller.admin;

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
        HttpSession session = request.getSession();
        Pelicula pelicula = Pelicula.buscarPelicula(request.getParameter("pelicula"));
        Sala sala = Sala.buscarSala(Integer.parseInt(request.getParameter("numSala")));
        String horaDeFuncion = request.getParameter("horaDeFuncion");
        String formato = request.getParameter("formato");
        if(pelicula != null){
            boolean isCrossing = false;
            for(Funcion funcion: pelicula.getFunciones()){
                if(funcion.getHoraDeFuncion().equals(horaDeFuncion)){
                    isCrossing =true;
                }
            }
            if(!isCrossing){
                new Funcion(pelicula, sala, horaDeFuncion, formato);
            }
        }
        
        request.setAttribute("funciones_", Funcion.getFunciones());
        request.setAttribute("Pelis", Pelicula.pelis);
        request.setAttribute("Salas", Sala.listaSala);
        RequestDispatcher view = request.getRequestDispatcher("funciones.jsp");
        view.forward(request, response);
    }
}
