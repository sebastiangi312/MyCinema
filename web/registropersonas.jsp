<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="POST" action="./Personas">
    Nombre: <input type="text" name="nombre" required /><br /><br />
    Apellido: <input type="text" name="apellido" required /><br /><br />
    Correo: <input type="email" name="correo" required /><br /><br />
    clave: <input type="password" name="clave" required/><br /><br />
    Edad: <input type="text" name="edad" required /><br /><br />
    tipo provicional: <select name="Admin/Usuario">
        <option value="Usuario">Usuario</option> 
        <option value="Administrador">Administrador</option> 
    </select><br /><br />
    <input type="submit" value="Registrar" />
</form>
<%@include file="footer.jsp" %>
