<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row align-items-center">
        <div class="col-lg-4 col-12 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Register</h1>
                        <form method="POST" action="./Personas">
                            <div class="form-group mt-2">
                              <label for="exampleInputEmail1">Name</label>
                              <input type="text" class="form-control mt-1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your name" name="nombre" required>
                            </div>
                            <div class="form-group mt-2">
                              <label for="exampleInputEmail1">Last Name</label>
                              <input type="text" class="form-control mt-1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your last name" name="apellido" required>
                            </div>
                            <div class="form-group mt-2">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control mt-1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="correo" required>
                            </div>
                            <div class="form-group mt-2">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" class="form-control mt-1" id="exampleInputPassword1" placeholder="Password" name="clave" required>
                            </div>
                            <div class="form-group mt-2">
                              <label for="exampleInputEmail1">Age</label>
                              <input type="number" min="0" class="form-control mt-1" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Age" name="edad" required>
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail1">User type</label>
                                <select class="form-select" aria-label="Default select example" name="Admin/Usuario">
                                    <option value="Usuario">User</option> 
                                    <option value="Administrador">Admin</option> 
                                </select>
                            </div>
                        <button type="submit" class="btn btn-primary mt-2" value="Registrar" >Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
