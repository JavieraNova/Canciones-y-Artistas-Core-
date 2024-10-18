package com.javieranova.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javieranova.modelos.Artista;
import com.javieranova.repositorios.RepositorioArtistass;

@Service
public class ServicioArtistas {
	
    @Autowired
    private final RepositorioArtistass repositorioArtistass;

    public ServicioArtistas(RepositorioArtistass repositorioArtistass) {
        this.repositorioArtistass = repositorioArtistass;
    }
    
    public List<Artista> obtenerTodosLosArtistas() {
        return this.repositorioArtistass.findAll();
    }
    
    public Artista obtenerArtistaPorId(Long id_artista) {
        return this.repositorioArtistass.findById(id_artista).orElse(null);
    }
    
    public Artista agregarArtista(Artista artista) {
        return this.repositorioArtistass.save(artista);
    }

}
