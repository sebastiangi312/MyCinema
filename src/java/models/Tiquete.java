
package models;

public class Tiquete {
    private static int contadorID = 1;
    private Funcion funcion_;
    private Factura factura_;
    private int silla_;
    private int ID_;
    private int precio_;

    public Tiquete(Funcion funcion, int silla, int precio) {
        this.funcion_ = funcion;
        this.silla_ = silla;
        this.ID_ = Tiquete.contadorID;
        Tiquete.contadorID++;
        this.precio_ = precio;
    }

    public Funcion getFuncion() {
        return funcion_;
    }

    public Factura getFactura() {
        return factura_;
    }

    public int getSilla() {
        return silla_;
    }

    public int getID() {
        return ID_;
    }

    public int getPrecio() {
        return precio_;
    }

}

