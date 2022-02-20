<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${funcion != null}">
    <table style=" text-align: center">
        <tr>
            <td><a>Nombre Pelicula</a></td>
            <td><a>Numero Sala</a></td>
            <td><a>Hora Funcion</a></td>
            <td><a>Sillas Disponibles</a></td>
            <td><a>Formato</a></td> 
        </tr>
        <tr>
            <td><a>${funcion.getPelicula().getNombre()}</a></td>
            <td><a>${funcion.getSala().getNumeroSala()}</a></td>
            <td><a>${funcion.getHoraDeFuncion()}</a></td>
            <td><a>${funcion.getSillasDisponibles().size()}</a></td>
            <td><a>${funcion.getFormato()}</a></td>
            <c:if test="${sessionScope.aPersona  != null}">
                <td  style=" width: 15% ; text-align: center">
                    <h4><a href="./Comprar?funcion=${funcion.getPelicula().concatenar(funcion.getPelicula(),funcion.getHoraDeFuncion())}">Obtener Tiquetes</a></h4>
                </td>
            </c:if>
            <c:if test="${sessionScope.aPersona  == null}">
                <td  style=" width: 15% ; text-align: center">
                    <h4><a href="./LogIn">Obtener Tiquetes</a></h4>
                </td>
            </c:if>
        </tr>
    </table>
</c:if>
<a href="./VerPelicula?pelicula=${pelicula}">Volver</a>
<%@include file="footer.jsp" %>