package models;

import java.util.LinkedList;
import java.util.Date;
public class Factura {
    private static int contadorId = 1;
    private int Id_;
    private String comprador_;
    private LinkedList<Tiquete> tiquete_ = new LinkedList<>();
    private int precio_;
    private Date horacompra_;

    public Factura(String comprador) {
        this.comprador_ = comprador;
        this.precio_ = 0;
        this.Id_ = Factura.contadorId;
        Factura.contadorId++;
    }
    
    public void agregarTiquete(Tiquete tiquete){
        this.tiquete_.add(tiquete);
        this.precio_+= tiquete.getPrecio();
        this.horacompra_ = new java.util.Date();
    }
    
    public String getComprador() {
        return comprador_;
    }

    public LinkedList<Tiquete> getTiquete() {
        return tiquete_;
    }

    public int getPrecio() {
        return precio_;
    }
    public int getId(){
        return Id_;
    }
}
