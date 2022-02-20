<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="POST" action="./LogIn">
    Correo Electronico: <input type="email" name="correo" required /><br /><br />
    Clave: <input type="password" name="clave" required/><br /><br />
    <input type="submit" value="Ingresar" />
</form>
<c:if test="${error != null}">
    <c:set var="var" value="usuario"/>  
    <c:if test="${error == var}">
        El Usuario No Existe
    </c:if>
    <c:set var="var" value="password"/>  
    <c:if test="${error == var}">
        password Incorrecta
    </c:if>
</c:if>

<%@include file="footer.jsp" %>
