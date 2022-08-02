package controller.admin;

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
        int numberRoom = Integer.parseInt(request.getParameter("numSala"));
        int seats = Integer.parseInt(request.getParameter("numSillas"));
        String parameter = null;
        if (Sala.buscarSala(numberRoom) == null){
            Sala room = new Sala(numberRoom,seats );
        } else{
            parameter = "existe";
        }
        request.setAttribute("listaSala", Sala.listaSala);
        request.setAttribute("salaExiste",parameter);
        RequestDispatcher view = request.getRequestDispatcher("salas.jsp");
        view.forward(request, response);
    }
}
