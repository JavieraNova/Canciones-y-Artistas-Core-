package com.javieranova.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.javieranova.modelos.Artista;
import com.javieranova.servicios.ServicioArtistas;

@Controller
public class ControladorArtistas {

    @Autowired
    private ServicioArtistas servicioArtistas;

    // Ruta para desplegar todos los artistas
    @GetMapping("/artistas")
    public String desplegarArtistas(Model model) {
        List<Artista> listaArtistas = servicioArtistas.obtenerTodosLosArtistas();
        model.addAttribute("artistas", listaArtistas);
        return "artistas.jsp"; // Asegúrate de que esta vista esté creada
    }

    // Ruta para mostrar detalles de un artista
    @GetMapping("/artistas/detalle/{idArtista}")
    public String desplegarDetalleArtista(@PathVariable Long idArtista, Model model) {
        Artista artista = servicioArtistas.obtenerArtistaPorId(idArtista);
        
        if (artista != null) {
            model.addAttribute("artista", artista);
        } else {
            return "redirect:/artistas"; // Redirige si no se encuentra el artista
        }

        return "detalleArtista.jsp"; // Asegúrate de que esta vista esté creada
    }

    // Ruta para mostrar el formulario de agregar artista
    @GetMapping("/artistas/formulario/agregar")
    public String formularioAgregarArtista(Model model) {
        model.addAttribute("artista", new Artista());
        return "agregarArtista.jsp"; // Asegúrate de que esta vista esté creada
    }
    
    // Ruta para mostrar el formulario de agregar artista (con ID)
    @GetMapping("/artistas/formulario/agregar/{idArtista}")
    public String formularioAgregarArtistaConId(@PathVariable Long idArtista, Model model) {
        Artista artista = servicioArtistas.obtenerArtistaPorId(idArtista);
        
        if (artista != null) {
            model.addAttribute("artista", artista);
        } else {
            return "redirect:/artistas"; // Redirige si no se encuentra el artista
        }

        return "agregarArtista.jsp"; // Asegúrate de que esta vista esté creada
    }

    // Ruta para procesar la adición de un artista
    @PostMapping("/artistas/procesa/agregar")
    public String procesarAgregarArtista(@ModelAttribute Artista artista, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "agregarArtista.jsp"; // Vuelve al formulario si hay errores
        }
        
        servicioArtistas.agregarArtista(artista); // Agrega el artista a la base de datos
        return "redirect:/artistas"; // Redirige a la lista de artistas
    }
}
