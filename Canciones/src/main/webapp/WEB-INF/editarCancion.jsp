<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aplicación de Canciones - Agregar Canción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/canciones.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>Editar Canción</h1>
        </div>
        <div class="row">
            <form:form class="col-6" action="/canciones/procesa/editar/${cancion.id}" method="POST" modelAttribute="cancion">
            	<input type="hidden" name="_method" value="PUT"/>
                <div class="mb-3">
                    <form:label class="form-label" path="titulo"> Título:</form:label>
                    <form:input class="form-control" path="titulo" />
                    <form:errors class="alert alert-danger d-block" path="titulo" />
                </div>
                <div class="mb-3">
                    <form:label class="form-label" path="artista"> Artista:</form:label>
                    <form:input class="form-control" path="artista" />
                    <form:errors class="alert alert-danger d-block" path="artista" />
                </div>
                <div class="mb-3">
                    <form:label class="form-label" path="album"> Álbum:</form:label>
                    <form:input class="form-control" path="album" />
                    <form:errors class="alert alert-danger d-block" path="album" />
                </div>
                <div class="mb-3">
                    <form:label class="form-label" path="genero"> Género:</form:label>
                    <form:input class="form-control" path="genero" />
                    <form:errors class="alert alert-danger d-block" path="genero" />
                </div>
                <div class="mb-3">
                    <form:label class="form-label" path="idioma"> Idioma:</form:label>
                    <form:input class="form-control" path="idioma" />
                    <form:errors class="alert alert-danger d-block" path="idioma" />
                </div>
                <button class="btn btn-primary">Agregar</button>
            </form:form>
        </div>
        <div class="mt-4">
            <a href="/canciones" class="btn btn-secondary">Volver a lista de canciones.</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
