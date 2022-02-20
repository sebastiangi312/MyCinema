<%@include file="header.jsp" %>
<table>
    <tr>
        <td>
            <h3>Persona que utilizo mas dinero en el cine :</h3>
        </td>
        <td>
            <c:if test="${MayorD.getNombre()== null}">
                <h1> No se utilizado dinero aun.</h1>
            </c:if>
            <c:if test="${MayorD.getNombre() != null}">
                <h1> ${MayorD.getNombre()} con una cantidad de ${MayorD.getDineroUtilizado()} dinero utilizado.</h1>
            </c:if> 
        </td>
    </tr>
    <tr>
        <td>
            <h3>Ultima persona en reservar asientos :</h3>
        </td>
        <td>
            <c:if test="${factura.getComprador()== null}">
                <h1> No se han reservado asientos.</h1>
            </c:if>
            <c:if test="${factura.getComprador() != null}">
                <h1> ${factura.getComprador()} con la factura numero ${factura.getId()} con una cantidad de ${factura.getPrecio()} dinero utilizado.</h1>
            </c:if>

        </td>
    </tr>
    <tr>
        <td>
            <h3>Pelicula con mayor asistencia :</h3>
        </td>
        <td>
            <c:if test="${PAsisMaxima.getNombre()== null}">
                <h1> No han ingresado usuarios a las peliculas.</h1>
            </c:if>
            <c:if test="${PAsisMaxima.getNombre() != null}">
                <h1>${PAsisMaxima.getNombre()} con una asistencia de: ${AsisMaxima} personas</h1>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Pelicula con menor asistencia :</h3>
        </td>
        <td>
            <c:if test="${PAsisMinima.getNombre()== null}">
                <h1> No han ingresado usuarios a las peliculas.</h1>
            </c:if>
            <c:if test="${PAsisMinima.getNombre() != null}">
                <h1>${PAsisMinima.getNombre()} con una asistencia de: ${AsisMinima} personas</h1>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Pelicula con mejor valorada :</h3>
        </td>
        <td>
            <c:if test="${PVMaxima.getNombre()== null}">
                <h1> No han valorado la pelicula.</h1>
            </c:if>
            <c:if test="${PVMaxima.getNombre() != null}">
                <h1>${PVMaxima.getNombre()} con una valoracion de: ${valMaxima} puntos</h1>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Pelicula con peor valorada :</h3>
        </td>
        <td>
            <c:if test="${PVMinima.getNombre()== null}">
                <h1> No han valorado la pelicula.</h1>
            </c:if>
            <c:if test="${PVMinima.getNombre() != null}">
                <h1>${PVMinima.getNombre()} con una valoracion de: ${valMinima} puntos</h1>
            </c:if>
        </td>
    </tr>

</table>
<%@include file="footer.jsp" %>