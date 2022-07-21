<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <button class="col-12 col-lg-1 btn btn-outline-primary me-2 mt-2" onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-12 col-lg-7 d-flex mt-2 justify-content-center">Rooms</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-lg-3 col-12">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Create Room</h1>
                    <form method="POST" action="./Salas">
                        <div class="form-group mt-4">
                            <label for="numSala">Room:</label>
                            <input type="number" name="numSala" id="numSala" min="1" required /><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="numSillas">Number of seats:</label>
                            <select name="numSillas" id="numSillas">
                                <option value="10">10</option> 
                                <option value="20">20</option> 
                                <option value="30">30</option> 
                                <option value="40">40</option> 
                                <option value="50">50</option>    
                            </select><br /><br />
                        </div>
                        <button class="btn btn-primary mt-2" type="submit" value="Crear Sala" >Create</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-12  mt-5">
            <c:set var="var" value="existe"/>  
            <c:if test="${not empty listaSala}">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Room #</th>
                            <th scope="col">Number of seats</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listaSala}" var="sala">
                            <tr>
                                <td scope="row">${sala.getNumeroSala()}</td>
                                <td scope="row">${sala.getCantidadSillas()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${salaExiste == var}">
                <p class="alert alert-warning">La sala ya existe</p>
            </c:if>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
