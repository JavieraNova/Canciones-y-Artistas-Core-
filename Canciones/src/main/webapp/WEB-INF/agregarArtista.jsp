<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Artista</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Agregar Artista</h1>
        
        <form action="/artistas/procesa/agregar" method="post">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido" required>
            </div>
            <div class="mb-3">
                <label for="biografia" class="form-label">Biografía</label>
                <textarea class="form-control" id="biografia" name="biografia" rows="3" required></textarea>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-primary">Guardar Artista</button>
                <a href="/artistas" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</body>
</html>

