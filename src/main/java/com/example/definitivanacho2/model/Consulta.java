package com.example.definitivanacho2.model;

import java.util.Date;

public class Consulta {
    private int idPersonal;
    private String nombre;
    private String apellido;
    private Date registro;

    public Consulta(int idPersonal, String nombre, String apellido, Date registro) {
        this.idPersonal = idPersonal;
        this.nombre = nombre;
        this.apellido = apellido;
        this.registro = registro;
    }

    // Getters y setters (puedes agregarlos si los necesitas)

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
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

    public Date getRegistro() {
        return registro;
    }

    public void setRegistro(Date registro) {
        this.registro = registro;
    }
}
