package models;

import java.util.*;

public class Funcion {

    private static ArrayList<Funcion> funciones_ = new ArrayList<>();
    private Pelicula pelicula_;
    private Sala sala_;
    private String horaDeFuncion_;
    private ArrayList<Tiquete> listaTiquetes = new ArrayList<>();
    private String formato_;
    private LinkedList<Integer> sillasDisponibles_ = new LinkedList<Integer>();

    public Funcion(Pelicula pelicula, Sala sala, String horaDeFuncion, String formato) {
        this.pelicula_ = pelicula;
        this.sala_ = sala;
        this.horaDeFuncion_ = horaDeFuncion;
        this.formato_ = formato;
        if (!funciones_.contains(this) && sala_.getNumeroSala() != 0) {
            Funcion.funciones_.add(this);
            sala.añadirFuncion(this);
            pelicula.añadirFuncion(this);
            crearTiquetes(sala.getCantidadSillas());
        }
    }

    public ArrayList<Tiquete> getListaTiquetes() {
        return listaTiquetes;
    }

    public static ArrayList<Funcion> getFunciones() {
        return funciones_;
    }

    public Pelicula getPelicula() {
        return pelicula_;
    }

    public Sala getSala() {
        return sala_;
    }

    public String getHoraDeFuncion() {
        return horaDeFuncion_;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }

    private void crearTiquetes(int sillas) {
        for (int i = 0; i < sillas; i++) {
            if (this.formato_.equals("2D")) {
                this.listaTiquetes.add(new Tiquete(this, i + 1, 4000));
            } else if (this.formato_.equals("3D")) {
                this.listaTiquetes.add(new Tiquete(this, i + 1, 6000));
            } else {
                this.listaTiquetes.add(new Tiquete(this, i + 1, 10000));
            }
        }
        for (int i = 0; i < this.sala_.getCantidadSillas(); i++) {
            this.sillasDisponibles_.add(i + 1);
        }
    }

    public LinkedList<Integer> getSillasDisponibles() {
        return sillasDisponibles_;
    }

    public String getFormato() {
        return formato_;
    }

    public Tiquete buscarTiquete(int numeroSilla) {
        for (Tiquete tiquete : this.listaTiquetes) {
            if (tiquete.getSilla() == numeroSilla) {
                return tiquete;
            }
        }
        return null;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + Objects.hashCode(this.pelicula_);
        hash = 83 * hash + Objects.hashCode(this.sala_);
        hash = 83 * hash + Objects.hashCode(this.horaDeFuncion_);
        hash = 83 * hash + Objects.hashCode(this.formato_);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Funcion other = (Funcion) obj;
        if (!Objects.equals(this.horaDeFuncion_, other.horaDeFuncion_)) {
            return false;
        }
        if (!Objects.equals(this.formato_, other.formato_)) {
            return false;
        }
        if (!Objects.equals(this.pelicula_, other.pelicula_)) {
            return false;
        }
        return Objects.equals(this.sala_, other.sala_);
    }

}
