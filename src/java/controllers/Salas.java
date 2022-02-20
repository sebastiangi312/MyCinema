package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Sala;

@WebServlet(urlPatterns = {"/Salas"})
public class Salas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listaSala", Sala.listaSala);
        RequestDispatcher view = request.getRequestDispatcher("salas.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int numSala = Integer.parseInt(request.getParameter("numSala"));
        int numSillas = Integer.parseInt(request.getParameter("numSillas"));
        String p = null;
        if (Sala.buscarSala(numSala) == null){
            new Sala(numSala,numSillas );
        } else{
            p = "existe";
        }
        request.setAttribute("listaSala", Sala.listaSala);
        request.setAttribute("salaExiste",p);
        RequestDispatcher view = request.getRequestDispatcher("salas.jsp");
        view.forward(request, response);
    }
}
