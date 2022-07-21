<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./PeliculasUsuario'">Back to Movies</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">${pelicula.getNombre()} - 
        <c:if test="${pelicula.getPuntuacion() != 0}">
            ${pelicula.getPuntuacion()} points
        </c:if>
        <c:if test="${pelicula.getPuntuacion() == 0}">
            No votes
        </c:if></h1>
    </div>
    <table style=" text-align: center">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Format</th>
                <th scope="col">Time</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="funcionPelicula" items="${pelicula.getFunciones()}">
                <tr>
                    <td scope="row">${funcionPelicula.getFormato()}</td>
                    <td scope="row"><a href="./VerFuncion?funcionDePelicula=${pelicula.concatenar(pelicula,funcionPelicula.getHoraDeFuncion())}">${funcionPelicula.getHoraDeFuncion()}</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="footer.jsp" %>