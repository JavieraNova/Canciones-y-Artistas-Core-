<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Artistas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container artistas-lista">
        <h1 class="mb-4">Lista de Artistas</h1>
        
        <!-- Botón para agregar un nuevo artista -->
        <a href="/artistas/formulario/agregar" class="btn btn-primary mb-3">Agregar Artista</a>

        <ul class="list-group">
            <c:forEach items="${artistas}" var="artista">
                <li class="list-group-item">
                    <a href="/artistas/detalle/${artista.id}" class="text-decoration-none">
                        ${artista.nombre} ${artista.apellido}
                    </a>
                </li>
            </c:forEach>
        </ul>
        
        <div class="mt-4">
            <a href="/canciones" class="btn btn-success">Ir a canciones</a>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
