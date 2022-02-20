<%@include file="header.jsp" %>
<c:if test="${multiArreglo != null}">
        Seleccione los asientos que desee comprar para ver la funcion:
    <form method="POST" action="./Comprar?funcion=${peliculaHora}">
    <table>
        <c:forEach var="arreglo" items="${multiArreglo}">
            <tr>
                <c:forEach var="tiquete" items="${arreglo}">
                    <c:if test="${sillasDisponibles.indexOf(tiquete.getSilla())<0}">
                        <td style=" color: #E13300 ">
                            ${tiquete.getSilla()}
                        </td>
                    </c:if>
                    <c:if test="${sillasDisponibles.indexOf(tiquete.getSilla())>=0}">
                        <td style=" color: black ">
                            <input type="checkbox" name="${tiquete.getSilla()}" value="${tiquete.getSilla()}">${tiquete.getSilla()}
                        </td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
        <input type="submit" value="Reservar"/>
    </form>
</c:if>

<%@include file="footer.jsp" %>