<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="POST" action="./Peliculas">
    Name: <input type="text" name="name" required /><br /><br />
    Genero:
    <select name="genero">
        <option value="Accion">Accion</option> 
        <option value="Aventura">Aventura</option>    
        <option value="CienciaFiccion">Ciencia Ficcion</option>
        <option value="Drama">Drama</option>
        <option value="Romance">Romance</option>
        <option value="SuperHeroes">Super Heroes</option>
        <option value="Suspenso">Suspenso</option>  
        <option value="Terror">Terror</option>
    </select><br /><br />
    Edad: <input type="text" name="edad" required/><br /><br />
    <input type="submit" value="Guardar" />
</form>
<c:if test="${not empty Pelis}">
    <table style=" text-align: center">
        <tr>
            <th width="120">Name</th>
            <th width="120">Genero</th>
            <th width="120">Edad</th>
        </tr>
        <c:forEach items="${Pelis}" var="pro">
            <c:if test="${pro.getNombre() != null}">
                <tr>
                    <td>${pro.getNombre()}</td>
                    <td>${pro.getGenero()}</td>
                    <td>${pro.getEdad()}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:if>
<%@include  file="footer.jsp" %>
