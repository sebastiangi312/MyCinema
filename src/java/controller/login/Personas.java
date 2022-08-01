
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
        getInitialData(request);
        request.setAttribute("listaRegistros", Persona.getListaPersonas());
        RequestDispatcher view = request.getRequestDispatcher("registropersonas.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String AoU = request.getParameter("Admin/Usuario");
        Persona p = new Persona(nombre, apellido, correo, clave, edad, AoU);
        request.setAttribute("listaRegistros", Persona.getListaPersonas());
        session.setAttribute("listaRegistros", Persona.getListaPersonas());
        
        RequestDispatcher view = request.getRequestDispatcher("logIn.jsp");
        view.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void getInitialData(HttpServletRequest request){
        HttpSession session = request.getSession();
        Singleton.initializeExampleData();
        if (null == session.getAttribute("listaRegistros")) {
            request.setAttribute("listaRegistros", Persona.getListaPersonas());
            session.setAttribute("listaRegistros", Persona.getListaPersonas());
        }
    }
}
