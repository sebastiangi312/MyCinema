<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="POST" action="./Funciones">
    Pelicula: <input type="text" name="pelicula" required /><br /><br />
    Numero de la Sala: <input type="text" name="numSala" required/><br /><br />
    Hora de la Funcion: <input type="text" name="horaDeFuncion" required /><br /><br />
    Formato:
    <select name="formato" required>
        <option value="2D">2D</option> 
        <option value="3D">3D</option> 
        <option value="4D">4D</option>   
    </select><br /><br />
    <input type="submit" value="Crear Funcion" />
</form>

<c:if test="${not empty funciones_}">
    <table style=" text-align: center">
        <tr>
            <th width="180">Pelicula</th>
            <th width="120">Numero de la Sala</th>
            <th width="120">Hora de la Funcion</th>
            <th width="120">Formato</th>
        </tr>
        <c:forEach items="${funciones_}" var="pro">
            <tr>
                <td>${pro.getPelicula().getNombre()}</td>
                <td>${pro.getSala().getNumeroSala()}</td>
                <td>${pro.getHoraDeFuncion()}</td>
                <td>${pro.getFormato()}</td>
                <td>${pro.getSillasDisponibles()}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty funciones_}">
    No existe
</c:if>
<%@include  file="footer.jsp" %>