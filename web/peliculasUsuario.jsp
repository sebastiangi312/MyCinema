<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${empty Pelis}">
    <p>El cine no tiene peliculas actualmente</p>
</c:if>
<c:if test="${not empty Pelis}">
    <table >
        <form method="POST" action="./PeliculasUsuario">
            <tr>
                <td width='350px'>Buscar Pelicula</td>
                <td width='350px'>Genero</td>
                <td width='350px'>Edad</td>
            </tr>
            <tr>
                <td width='350px'>
                    <input type="text" name="pelibuscada"/><br /><br />
                </td>
                <td width='150px'>
                    <select name="genero">
                        <option value="Todos">Todos</option> 
                        <option value="Accion">Accion</option> 
                        <option value="Aventura">Aventura</option>    
                        <option value="CienciaFiccion">Ciencia Ficcion</option>
                        <option value="Drama">Drama</option>
                        <option value="Romance">Romance</option>
                        <option value="SuperHeroes">Super Heroes</option>
                        <option value="Suspenso">Suspenso</option>  
                        <option value="Terror">Terror</option>
                    </select><br /><br /> 
                </td>
                <td width='350px'>
                    <input type="text" name="edad"/><br /><br />
                </td>
                <td><input type="submit" value="Filtrar" /></td>
                
            </tr>
            
        </form>
    </table>
    <table style=" text-align: center">
        <tr>
            <td width='180px'>
                Pelicula:
            </td>
            <td width='180px'>
                Genero
            </td>
            <td width='180px'>
                Edad
            </td>
        </tr>
        <c:forEach items="${Pelis}" var="pelicula">
            <tr>
                <td><a href="./VerPelicula?pelicula=${pelicula.getNombre()}">${pelicula.getNombre()}</a></td>
                <td>${pelicula.getGenero()}</td>
                <td>${pelicula.getEdad()}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<%@include file="footer.jsp" %>