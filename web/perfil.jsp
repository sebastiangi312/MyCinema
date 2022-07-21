<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">
    <div class="row align-items-start">
        <div class="col-4 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Profile</h1>
                        <div class="row">
                            <h5 class="col-5">Name:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getNombre()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Last Name:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getApellido()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Email:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getCorreo()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Age:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getEdad()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Password:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getClave()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Type</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${aPersona.getTipo()}</p>
                        </div>
                        <div class="mt-3 d-flex mt-auto justify-content-center">
                            <button class="btn btn-outline-primary me-2"  onclick="window.location.href='./Home'">Back to Home</button>
                            <button class="btn btn-outline-danger"  onclick="window.location.href='./CerrarSesion';">Sign Out</button> 
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>