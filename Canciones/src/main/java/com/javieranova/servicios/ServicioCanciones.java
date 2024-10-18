package com.javieranova.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javieranova.modelos.Cancion;
import com.javieranova.repositorios.RepositorioCanciones;

@Service
public class ServicioCanciones {
    
    @Autowired
    private RepositorioCanciones repositorioCanciones;

    public List<Cancion> obtenerTodasLasCanciones() {
        return repositorioCanciones.findAll();
    }

    public Cancion obtenerCancionPorId(Long id) {
        Optional<Cancion> cancion = repositorioCanciones.findById(id);
        return cancion.orElse(null); 
    }

    public Cancion agregarCancion(Cancion cancion) {
        return repositorioCanciones.save(cancion); 
    }
    public Cancion actualizarCancion(Cancion cancion) {
        return repositorioCanciones.save(cancion); 
    }
    
    public void eliminaCancion(Long idLong) {
    	this.repositorioCanciones.deleteById(idLong);
    }
}