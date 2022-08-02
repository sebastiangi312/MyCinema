package controller.login;

import controller.Singleton;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Persona;

@WebServlet(name = "Personas", urlPatterns = {"/Personas"})
public class Personas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Singleton.getInitialData(request);
        RequestDispatcher view = request.getRequestDispatcher("registropersonas.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        createUser(request);
        updateRegister(request);
        RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
        view.forward(request, response);
    }

    private void createUser(HttpServletRequest request) {
        String name = request.getParameter("nombre");
        String lastName = request.getParameter("apellido");
        String email = request.getParameter("correo");
        String password = request.getParameter("clave");
        int age = Integer.parseInt(request.getParameter("edad"));
        String userType = request.getParameter("Admin/Usuario");
        Persona newUser = new Persona(name, lastName, email, password, age, userType);
    }

    private void updateRegister(HttpServletRequest request) {
        HttpSession session = request.getSession();
        request.setAttribute("listaRegistros", Persona.getListaPersonas());
        session.setAttribute("listaRegistros", Persona.getListaPersonas());
    }
}
