<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./VerPelicula?pelicula=${pelicula}'">Back to ${pelicula}</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">${funcion.getPelicula().getNombre()} - 
        <c:if test="${funcion.getPelicula().getPuntuacion() != 0}">
            ${funcion.getPelicula().getPuntuacion()} points
        </c:if>
        <c:if test="${funcion.getPelicula().getPuntuacion() == 0}">
            No votes
        </c:if></h1>
    </div>
    <table style=" text-align: center">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Room</th>
                <th scope="col">Time</th>
                <th scope="col">Available seats</th>
                <th scope="col">Format</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="funcionPelicula" items="${funciones}">
                <tr>
                    <td scope="row">${funcionPelicula.getSala().getNumeroSala()}</td>
                    <td scope="row">${funcionPelicula.getHoraDeFuncion()}</td>
                    <td scope="row">${funcionPelicula.getSillasDisponibles().size()}</td>
                    <td scope="row">${funcionPelicula.getFormato()}</td>
                    <c:if test="${sessionScope.aPersona  != null}">
                        <td><a href="./Comprar?funcion=${funcion.getPelicula().concatenar(funcion.getPelicula(),funcion.getHoraDeFuncion())}">Get Ticket</a></td>
                    </c:if>
                    <c:if test="${sessionScope.aPersona  == null}">
                        <td><a href="./LogIn">Get Ticket</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="footer.jsp" %>