<%@include file="header.jsp" %>
<h1><a href="./PeliculasUsuario"> Peliculas</a></h1>
<c:if test="${sessionScope.aPersona  == null}">
    <td  style=" width: 15% ; text-align: center">
        <h1><a href="./LogIn">Votar Peliculas</a></h1>
    </td>
</c:if>
<c:if test="${sessionScope.aPersona  != null}">
    <td  style=" width: 15% ; text-align: center">
        <h1><a href="./VotarPeliculas"> Votar Peliculas </a></h1>
    </td>
</c:if>
<%@include file="footer.jsp" %>
