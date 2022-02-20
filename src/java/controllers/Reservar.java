/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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

/**
 *
 * @author juan pablo cano
 */
@WebServlet(name = "Reservar", urlPatterns = {"/Reservar"})
public class Reservar extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Integer> sillasDisponibles_ = new ArrayList<Integer>();
        if (null != session.getAttribute("Funciones")) {
            sillasDisponibles_ = (ArrayList<Integer>) session.getAttribute("Funciones");
        }
        request.setAttribute("sillasDisponibles_", sillasDisponibles_);
        RequestDispatcher view = request.getRequestDispatcher("reservar.jsp");
        view.forward(request, response);
        
        
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Integer> sillasDisponibles_ = new ArrayList<Integer>();
        if (null != session.getAttribute("Funciones")) {
            sillasDisponibles_ = (ArrayList<Integer>) session.getAttribute("Reservar");
        }
        int p = Integer.parseInt(request.getParameter("numSilla"));
        sillasDisponibles_.remove(p+1);
        session.setAttribute("Funciones", sillasDisponibles_);
        request.setAttribute("sillasDisponibles_", sillasDisponibles_);
        RequestDispatcher view = request.getRequestDispatcher("reservar.jsp");
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

}
