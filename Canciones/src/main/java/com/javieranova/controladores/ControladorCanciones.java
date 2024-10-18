package com.javieranova.controladores;

import java.util.List;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.DeleteMapping;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.javieranova.modelos.Artista;
import com.javieranova.modelos.Cancion;
import com.javieranova.servicios.ServicioArtistas;
import com.javieranova.servicios.ServicioCanciones;

@Controller
public class ControladorCanciones {
    
	@Autowired
    private final ServicioCanciones servicioCanciones;
    private final ServicioArtistas servicioArtistas;
    
    public ControladorCanciones(ServicioCanciones servicioCanciones,
            ServicioArtistas servicioArtistas) {
	this.servicioCanciones = servicioCanciones;
	this.servicioArtistas = servicioArtistas;
	}

    @GetMapping("/canciones")
    public String desplegarCanciones(Model model) {
        List<Cancion> listaCanciones = servicioCanciones.obtenerTodasLasCanciones();
        model.addAttribute("canciones", listaCanciones);
        return "canciones.jsp";
    }

    @GetMapping("/canciones/detalle/{idCancion}")
    public String desplegarDetalleCancion(@PathVariable("idCancion") Long idCancion, Model model) {
        Cancion cancion = servicioCanciones.obtenerCancionPorId(idCancion);
        
        if (cancion != null) {
            model.addAttribute("cancion", cancion);
        } else {
            return "redirect:/canciones";
        }

        return "detalleCancion.jsp";
    }

    @GetMapping("/canciones/formulario/agregar")
    public String formularioAgregarCancion(Model model) {
        model.addAttribute("cancion", new Cancion());
        if (servicioArtistas == null) {
            throw new RuntimeException("El servicio de artistas no fue inyectado correctamente.");
        }
        // Agrega la lista de artistas para mostrar en el select
        List<Artista> artistas = servicioArtistas.obtenerTodosLosArtistas();
        model.addAttribute("artistas", artistas);

        return "agregarCancion.jsp"; 
    }

    @PostMapping("/canciones/procesa/agregar")
    public String procesarAgregarCancion(@Valid @ModelAttribute Cancion cancion, 
                                         BindingResult bindingResult,
                                         @RequestParam Long id_artista, Model model) {
        if (bindingResult.hasErrors()) {
            // Re-agrega la lista de artistas al modelo en caso de errores
            List<Artista> artistas = servicioArtistas.obtenerTodosLosArtistas();
            model.addAttribute("artistas", artistas);
            return "agregarCancion.jsp"; 
        }

        Artista artista = this.servicioArtistas.obtenerArtistaPorId(id_artista);
        cancion.setArtista(artista);
        servicioCanciones.agregarCancion(cancion);

        return "redirect:/canciones";
    }

    
    @GetMapping("/canciones/formulario/editar/{idCancion}")
    public String formularioEditarCancion(@ModelAttribute Cancion cancion,
    									  @PathVariable Long idCancion, 
    									  Model modelo) {
    	 cancion = servicioCanciones.obtenerCancionPorId(idCancion);
    	 modelo.addAttribute("cancion", cancion);
    	 
    	 return "editarCancion.jsp";
    	 
    }
    
    @PutMapping("/canciones/procesa/editar/{idCancion}")
    public String procesarEditarCancion(@Valid @ModelAttribute Cancion cancion,
    									BindingResult validaciones,
    									@PathVariable Long idCancion) {
    	cancion.setId(idCancion);
    	if(validaciones.hasErrors()) {
    		return "editarCancion.jsp";
    	}
    	this.servicioCanciones.actualizarCancion(cancion);
    	return "redirect:/canciones";
    }
    
    @DeleteMapping("/canciones/eliminar/{idCancion}")
    public String procesarEliminarCancion(@PathVariable Long idCancion) {
    	this.servicioCanciones.eliminaCancion(idCancion);
    	return "redirect:/canciones";
    }
    
    
}