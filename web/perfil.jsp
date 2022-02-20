<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<table style=" text-align: center">
    <tr><th width="180">Nombre:</th><td>${aPersona.getNombre()}</td></tr>
    <tr><th width="120">Apellido:</th><td>${aPersona.getApellido()}</td></tr>
    <tr><th width="120">correo:</th><td>${aPersona.getCorreo()}</td></tr>
    <tr><th width="120">Edad</th><td>${aPersona.getEdad()}</td></tr>
    <tr><th width="120">clave</th><td>${aPersona.getClave()}</td></tr>
    <tr><th width="120">Usuario/Administrador </th><td>${aPersona.getTipo()}</td></tr>

</table>
<h1><a href="./Home">Volver Al Inicio</a></h1>
<h1><a href="./CerrarSesion">Cerrar Sesion</a></h1>
<%@include file="footer.jsp" %>