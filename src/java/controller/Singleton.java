
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import models.Funcion;
import models.Pelicula;
import models.Persona;
import models.Sala;


public class Singleton {
    
    public static void getInitialData(HttpServletRequest request){
        HttpSession session = request.getSession();
        initializeExampleData();
        if (null == session.getAttribute("listaRegistros")) {
            request.setAttribute("listaRegistros", Persona.getListaPersonas());
            session.setAttribute("listaRegistros", Persona.getListaPersonas());
        }
    }
    
    private static void initializeExampleData(){
        Sala room = new Sala(1,20);
        Pelicula movie =new Pelicula("Avengers","Action",18);
        Funcion showTime = new Funcion(movie ,room,"12:00","3D");
        Persona adminUser = new Persona("Admin","Cinema","admin@hotmail.com","admin",18,"Administrador");
        Persona normalUser = new Persona("User","Cinema","user@hotmail.com","user",18,"Usuario");
    }
}
