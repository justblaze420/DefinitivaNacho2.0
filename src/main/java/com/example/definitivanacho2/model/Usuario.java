package com.example.definitivanacho2.model;
import java.util.Date;
import java.sql.Connection;
public class Usuario {
    private int idPersonal;
    private String nombre;
    private String apellido;
    private String rol;
    private String usuario;
    private String contrasena;
    private int idDepartamento;
    private String nombreDepartamento;
    private Date registro;

    public Usuario(){
    }

    public Usuario(int idPersonal, String nombre, String apellido, String rol, int idDepartamento, String usuario, String contrasena) {
        this.idPersonal = idPersonal;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rol = rol;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.idDepartamento = idDepartamento;
        this.nombreDepartamento = nombreDepartamento;
        this.registro = registro;
    }

    // Getters y Setters
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

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getIdDepartamento() {
        return this.idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public Date getRegistro() {
        return registro;
    }

    public void setRegistro(Date registro) {
        this.registro = registro;
    }

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }
}