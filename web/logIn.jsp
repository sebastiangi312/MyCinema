<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row align-items-center">
        <div class="card col-lg-3 col-12 mt-3 me-5">
            <div class="card-body">
                <h5 class="card-title">Credentials Client</h5>
                <p class="card-text">email: user@hotmail.com <br>password: user</p>
            </div>
            <div class="card-body">
                <h5 class="card-title">Credentials Admin</h5>
                <p class="card-text">email: admin@hotmail.com <br>password: admin</p>
            </div>
        </div>
        <div class="col-10 col-lg-4 ms-5">
            <div class="card h-50 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Login</h1>
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
                        <c:set var="var" value="password"/>  
                        <p>Invalid User </p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
