<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<h1 class="d-flex mt-auto justify-content-center">Login</h1>
<form method="POST" action="./LogIn">
  <div class="form-group mt-2">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control mt-1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="correo" required>
  </div>
  <div class="form-group mt-2">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control mt-1" id="exampleInputPassword1" placeholder="Password" name="clave" required>
  </div>
  <button type="submit" class="btn btn-primary mt-2" value="Ingresar" >Login</button>
</form>
<c:if test="${error != null}">
    <c:set var="var" value="usuario"/>  
    <c:if test="${error == var}">
        <p>The email is not registered</p>
    </c:if>
    <c:set var="var" value="password"/>  
    <c:if test="${error == var}">
        <p>Incorrect password</p>
    </c:if>
</c:if>
</div>

<%@include file="footer.jsp" %>
