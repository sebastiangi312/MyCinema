
package controller;

import models.Funcion;
import models.Pelicula;
import models.Persona;
import models.Sala;


public class Singleton {
    
    public static void initializeExampleData(){
        Sala room = new Sala(1,20);
        Pelicula movie =new Pelicula("Avengers","Action",18);
        Funcion showTime = new Funcion(movie ,room,"12:00","3D");
        Persona adminUser = new Persona("Admin","Cinema","admin@hotmail.com","admin",18,"Administrador");
        Persona normalUser = new Persona("User","Cinema","user@hotmail.com","user",18,"Usuario");
    }
}
