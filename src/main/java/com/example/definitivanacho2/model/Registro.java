package com.example.definitivanacho2.model;

import java.util.Date;

public class Registro {
    private int idRegistro;
    private int idPersonal;
    private Date fechaEntrada;
    private Date fechaSalida;

    // Constructor
    public Registro(int idRegistro, int idPersonal, Date fechaEntrada, Date fechaSalida) {
        this.idRegistro = idRegistro;
        this.idPersonal = idPersonal;
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
}
