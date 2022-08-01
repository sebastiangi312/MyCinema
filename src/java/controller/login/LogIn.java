package controller.login;

import controller.Singleton;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Persona;

@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Singleton.getInitialData(request);
        RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view;

        Persona user = getUser(request);
        if (isUserValid(request, user)) {
            view = getViewByUserType(request, user.getTipo());
        } else {
            request.setAttribute("error", "error");
            view = request.getRequestDispatcher("logIn.jsp");
        }
        view.forward(request, response);
    }

    private Persona getUser(HttpServletRequest request) {
        String email = request.getParameter("correo");
        Persona user = Persona.buscarPorCorreo(email);
        return user;
    }

    private boolean isUserValid(HttpServletRequest request, Persona user) {
        HttpSession session = request.getSession();
        String password = request.getParameter("clave");
        if (user != null && user.getClave().equals(password)) {
            session.setAttribute("aPersona", user);
            return true;
        }
        session.setAttribute("aPersona", null);
        return false;
    }

    private RequestDispatcher getViewByUserType(HttpServletRequest request, String userType) {
        if (userType.equals("Usuario")) {
            return request.getRequestDispatcher("home.jsp");
        }
        return request.getRequestDispatcher("homeAdmin.jsp");
    }
}
