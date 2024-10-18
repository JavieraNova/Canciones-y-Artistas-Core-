<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle de Canción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="mb-4">Detalle de la Canción</h1>
        
        <div class="mb-3">
            <label>Título:</label>
            <p>${cancion.titulo}</p>
        </div>
        <div class="mb-3">
            <label>Artista:</label>
            <p>${cancion.artista}</p>
        </div>
        <div class="mb-3">
            <label>Álbum:</label>
            <p>${cancion.album}</p>
        </div>
        <div class="mb-3">
            <label>Género:</label>
            <p>${cancion.genero}</p>
        </div>
        <div class="mb-3">
            <label>Idioma:</label>
            <p>${cancion.idioma}</p>
        </div>
        
        <!-- Botón para actualizar la canción -->
        <form action="/canciones/eliminar/${cancion.id}" method="POST" class="d-inline">
    		<input type="hidden" name="_method" value="DELETE"/>
    	<button type="submit" class="btn btn-danger">Eliminar canción</button>
		</form>
			<a class="btn btn-secondary d-inline" href="/canciones">Volver a la lista de canciones</a>
			<a class="btn btn-primary d-inline" href="/canciones/formulario/editar/${cancion.id}">Actualizar Canción</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
