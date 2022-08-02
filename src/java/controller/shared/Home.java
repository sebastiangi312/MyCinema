package controller.shared;

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

@WebServlet(urlPatterns = {"/Home"})
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Singleton.getInitialData(request);

        String userType = getUserType(session);
        RequestDispatcher view = getViewByUserType(request, userType);
        view.forward(request, response);

    }

    private String getUserType(HttpSession session) {
        if (null != session.getAttribute("aPersona")) {
            Persona user = (Persona) session.getAttribute("aPersona");
            return user.getTipo();
        }
        return "notLogged";
    }

    private RequestDispatcher getViewByUserType(HttpServletRequest request, String userType) {
        if (userType.equals("Administrador")) 
            return request.getRequestDispatcher("homeAdmin.jsp");
        
        return request.getRequestDispatcher("home.jsp");
    }

}
