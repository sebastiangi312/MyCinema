<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<table style=" text-align: center">
    <tr>
        <th width="180">Pelicula</th>
        <th width="120">Puntuacion</th>
        
    </tr>
        <tr>
            <td>${pelicula.getNombre()}</td>
            <c:if test="${pelicula.getPuntuacion() != 0}">
            <td>${pelicula.getPuntuacion()}</td>
            </c:if>
            <c:if test="${pelicula.getPuntuacion() == 0}">
            <td>Esta Pelicula no tiene votos</td>
            </c:if>
            <td>
                <c:if test="${not empty pelicula.getListaFunciones_()}">
                    <td width="160">Funciones Posibles:</td>
                    <c:forEach var="funcionPelicula" items="${pelicula.getFunciones()}">
                        <td><a href="./VerFuncion?funcionDePelicula=${pelicula.concatenar(pelicula,funcionPelicula.getHoraDeFuncion())}">${funcionPelicula.getHoraDeFuncion()}:00</a></td>
                    </c:forEach>
                </c:if>
                <c:if test="${empty pelicula.getListaFunciones_()}">
                    <td><p>No se han asignado Funciones a esta pelicula<td></p>
                </c:if>
            </td>
        </tr>
</table>
<a href="./PeliculasUsuario">Volver</a>
<%@include file="footer.jsp" %>