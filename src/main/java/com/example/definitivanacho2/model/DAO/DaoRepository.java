package com.example.definitivanacho2.model.DAO;

import com.example.definitivanacho2.model.Usuario;

import java.util.List;

public interface DaoRepository <T>{
    List <T> findAll();
    T findOne(int id);
    boolean update (int id, Usuario prd);
    boolean delete (int id);
}
