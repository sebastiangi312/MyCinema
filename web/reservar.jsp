<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="POST" action="./Reservar">
    <input type="submit" value="ver Pelis" />
</form>

<c:if test="${not empty funciones_}">
    <table style=" text-align: center">
        <tr>
        <td width='180px'>
            Pelicula:
        </td>
        </tr>
    <c:forEach items="${funciones_}" var="pro">
        <tr>
            <td><a href="./Reservar?pelicula=${pro.getPelicula().getNombre()}">${pro.getPelicula().getNombre()}</a></td>
            <td> ${pro.getsillasDisponibles()}</td>
        </tr>
    </c:forEach>
</table>
</c:if>
<%@include file="footer.jsp" %>