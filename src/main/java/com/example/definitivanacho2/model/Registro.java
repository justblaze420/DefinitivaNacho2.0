package com.example.definitivanacho2.model;

import java.sql.Timestamp;
import java.sql.Time;
import java.util.List;
public class Registro {
    private int idRegistro;
    private int idPersonal;
    private Timestamp horaEntrada;
    private Timestamp horaSalida;
    private String nombre; // Campo para el nombre
    private String apellido;
    private Time duracion;

    public Registro() {}

    public Registro(int idRegistro, int idPersonal, Timestamp horaEntrada, Timestamp horaSalida) {
        this.idRegistro = idRegistro;
        this.idPersonal = idPersonal;
        this.horaEntrada = horaEntrada;
        this.horaSalida = horaSalida;
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

    public Timestamp getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(Timestamp horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public Timestamp getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Timestamp horaSalida) {
        this.horaSalida = horaSalida;
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
    public Time getDuracion() {
        return duracion;
    }

    // Setter para duración
    public void setDuracion(Time duracion) {
        this.duracion = duracion;
    }
}
