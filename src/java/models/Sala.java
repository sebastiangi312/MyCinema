package models;

import java.util.*;

public class Sala {

    private int cantidadSillas_;
    private int numeroSala_;
    public LinkedList<Funcion> funcionesDisponibles_ = new LinkedList<Funcion>();
    public static ArrayList<Sala> listaSala = new ArrayList<>();

    public Sala(int numeroSala, int cantidadSillas) {
        if (Sala.buscarSala(numeroSala) == null) {
            this.cantidadSillas_ = cantidadSillas;
            this.numeroSala_ = numeroSala;
            Sala.listaSala.add(this);
        }
    }

    public int getCantidadSillas() {
        return cantidadSillas_;
    }

    public int getNumeroSala() {
        return numeroSala_;
    }

    public static Sala buscarSala(int numSala) {
        for (Sala S : Sala.listaSala) {
            if (S.getNumeroSala() == numSala) {
                return S;
            }
        }
        return null;
    }

    public LinkedList<Funcion> getFuncionesDisponibles() {
        return funcionesDisponibles_;
    }

    public void añadirFuncion(Funcion funcion) {
        this.funcionesDisponibles_.add(funcion);
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + this.numeroSala_;
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
        final Sala other = (Sala) obj;
        return this.numeroSala_ == other.numeroSala_;
    }

    
}
