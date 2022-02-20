/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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

/**
 *
 * @author juan pablo cano
 */
@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

}
