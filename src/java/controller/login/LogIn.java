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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getInitialData(request);
        RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        Persona usuarioIngresado = Persona.buscarPorCorreo(correo);
        if(usuarioIngresado != null){
            if(usuarioIngresado.getClave().equals(clave)){
                session.setAttribute("aPersona", usuarioIngresado);
                if(usuarioIngresado.getTipo().equals("Usuario")){
                    RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                    view.forward(request, response);
                }else{
                    RequestDispatcher view = request.getRequestDispatcher("homeAdmin.jsp");
                    view.forward(request, response);
                }
            }else{
                request.setAttribute("error", "password");
                RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
                view.forward(request, response);
            }
        }else{
            request.setAttribute("error", "usuario");
            RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
            view.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void getInitialData(HttpServletRequest request){
        HttpSession session = request.getSession();
        Singleton.initializeExampleData();
        if (null == session.getAttribute("listaRegistros")) {
            request.setAttribute("listaRegistros", Persona.getListaPersonas());
            session.setAttribute("listaRegistros", Persona.getListaPersonas());
        }
    }
}
