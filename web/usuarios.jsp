<%@include file="header.jsp" %>
<tr>
<table style=" text-align: center">
    <tr>
        <th width="120">Nombre</th>
        <th width="120">Apellido</th>
        <th width="120">Correo</th>
        <th width="120">Clave</th>
        <th width="120">Edad</th>
        <th width="120">Usuario/Administrador </th>
    </tr>
    <c:forEach items="${listaRegistros}" var="persona">
        <tr>
            <td>${persona.getNombre()}</td>
            <td>${persona.getApellido()}</td>
            <td>${persona.getCorreo()}</td>
            <td>${persona.getClave()}</td>
            <td>${persona.getEdad()}</td>
            <td>${persona.getTipo()}</td>
        </tr>
    </c:forEach>
</table>

<%@include file="footer.jsp" %>
