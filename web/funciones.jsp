<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <button class="col-12 col-lg-1 btn btn-outline-primary me-2 mt-2" onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-12 col-lg-7 d-flex mt-2 justify-content-center">Tickets</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-12 col-lg-3">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Create ShowTime</h1>
                    <form method="POST" action="./Funciones">
                        <div class="form-group mt-2">
                            <label for="pelicula">Movie:</label>
                            <select name="pelicula" id="pelicula">
                            <c:forEach items="${Pelis}" var="pro">
                                <option value="${pro.getNombre()}">${pro.getNombre()}</option> 
                            </c:forEach>
                            </select><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="numSala">Room:</label>
                            <select name="numSala" id="numSala">
                            <c:forEach items="${Salas}" var="pro">
                                <option value="${pro.getNumeroSala()}">${pro.getNumeroSala()}</option> 
                            </c:forEach>
                            </select><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="horaDeFuncion">Time:</label>
                            <input type="time" name="horaDeFuncion" id="horaDeFuncion" required /><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="formato">Format:</label>
                            <select name="formato" id="formato">
                                <option value="2D">2D</option> 
                                <option value="3D">3D</option> 
                            </select><br /><br />
                        </div>
                        <button class="btn btn-primary mt-2" type="submit" value="Guardar" >Create</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-6  mt-5">
            <c:if test="${not empty Pelis}">
                <table style=" text-align: center">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Movie</th>
                            <th scope="col">Room</th>
                            <th scope="col">Time</th>
                            <th scope="col">Format</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${funciones_}" var="pro">
                                <tr>
                                    <td scope="row">${pro.getPelicula().getNombre()}</td>
                                    <td scope="row">${pro.getSala().getNumeroSala()}</td>
                                    <td scope="row">${pro.getHoraDeFuncion()}</td>
                                    <td scope="row">${pro.getFormato()}</td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
<%@include  file="footer.jsp" %>