
package com.emergentes.modelo;

import java.util.List;

public class Inscritos {
    private int id;
    private String fecha;
    private String nombre;
    private String apellido;
    private String turno;
    private String[] seminarios;

    public Inscritos() {
        this.id = 0;
        this.fecha = "";
        this.nombre = "";
        this.apellido = "";
        this.turno = "";
        this.seminarios = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String[] getSeminarios() {
        return seminarios;
    }

    public void setSeminarios(String[] seminarios) {
        this.seminarios = seminarios;
    }

    

    
    
    
    
    
}
