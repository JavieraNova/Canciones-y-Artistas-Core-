<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del Artista</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container artista-detalle">
        <h1 class="mb-4">Detalle del Artista</h1>
        
        <h2>${artista.nombre} ${artista.apellido}</h2>
        <p><strong>ID:</strong> ${artista.id}</p>
        <p><strong>Biografía:</strong> ${artista.biografia}</p>
        
        <h3>Canciones de ${artista.nombre}</h3>
        <ul class="list-group">
            <c:forEach items="${artista.canciones}" var="cancion">
                <li class="list-group-item">
                    ${cancion.titulo}
                </li>
            </c:forEach>
        </ul>

        <div class="mt-4">
            <a href="/artistas" class="btn btn-primary">Volver a lista de artistas</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
