package controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.*;

@WebServlet(name = "Comprar", urlPatterns = {"/Comprar"})
public class Comprar extends HttpServlet {

    private final int MAX_SEAT_PER_ROW = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Funcion showtime = getShowtime(request);
        setAvalaibleSeats(request, showtime);
        RequestDispatcher view = request.getRequestDispatcher("comprar.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Funcion showTime = getShowtime(request);
        LinkedList<Integer> purchasedTickets = getPurchasedTickets(request, showTime);
        if (!purchasedTickets.isEmpty()) {
            processPurchase(request, purchasedTickets, showTime);
            RequestDispatcher view = request.getRequestDispatcher("factura.jsp");
            view.forward(request, response);
        }
        this.doGet(request, response);
    }

    private Funcion getShowtime(HttpServletRequest request) {
        String hourShowTime = request.getParameter("funcion");
        String[] parts = hourShowTime.split("-");
        String movieName = parts[0];
        String hour = parts[1];
        Funcion showTime = Pelicula.buscarFuncion(Pelicula.buscarPelicula(movieName), hour);

        request.setAttribute("peliculaHora", hourShowTime);
        request.setAttribute("sillasDisponibles", showTime.getSillasDisponibles());
        request.setAttribute("funcion", showTime);
        request.setAttribute("pelicula", hour);

        return showTime;
    }

    private void setAvalaibleSeats(HttpServletRequest request, Funcion showTime) {
        ArrayList<ArrayList<Tiquete>> seats = new ArrayList<>();
        int rows = showTime.getListaTiquetes().size() / MAX_SEAT_PER_ROW;
        for (int i = 0; i < rows; i++) {
            seats.add(new ArrayList<>());
        }
        for (int row = 0; row < rows; row++) {
            for (int seat = 0; seat < MAX_SEAT_PER_ROW; seat++) {
                Tiquete ticket = (Tiquete) showTime.getListaTiquetes().get(seat + row * MAX_SEAT_PER_ROW);
                seats.get(row).add(ticket);
            }
        }
        request.setAttribute("multiArreglo", seats);
    }

    private LinkedList<Integer> getPurchasedTickets(HttpServletRequest request, Funcion showTime) {
        LinkedList<Integer> purchasedTickets = new LinkedList<>();
        for (int i = 1; i <= showTime.getSala().getCantidadSillas(); i++) {
            if (request.getParameter(String.valueOf(i)) != null) {
                purchasedTickets.add(Integer.parseInt(request.getParameter(String.valueOf(i))));
            }
        }
        return purchasedTickets;
    }

    private void processPurchase(HttpServletRequest request, LinkedList<Integer> purchasedTickets, Funcion showTime) {
        HttpSession session = request.getSession();
        Persona user = (Persona) session.getAttribute("aPersona");
        Factura bill = new Factura(user.getNombre().concat(" " + user.getApellido()));
        for (int numberSeat : purchasedTickets) {
            Tiquete ticket = showTime.buscarTiquete(numberSeat);
            if (ticket != null) {
                bill.agregarTiquete(ticket);
                showTime.getSillasDisponibles().remove(showTime.getSillasDisponibles().indexOf(ticket.getSilla()));
            }
        }
        showTime.getPelicula().aumentarAsistencia();
        
        session.setAttribute("tiquetesComprados", purchasedTickets);
        request.setAttribute("sillasDisponibles", showTime.getSillasDisponibles());
        request.setAttribute("factura", bill);
        session.setAttribute("factura", bill);
        
        Persona MayorD = Persona.mayorDinero(user);
        if (MayorD != null) {
            session.setAttribute("MayorD", MayorD);
        }
    }
}
