<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">Movies</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-3">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Create Movie</h1>
                    <form method="POST" action="./Peliculas">
                        <div class="form-group mt-4">
                            <label for="name">Name:</label>
                            <input type="text" name="name" id="name" required /><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="genero">Type:</label>
                            <select name="genero" id="genero">
                                <option value="Action">Action</option> 
                                <option value="Adventure">Adventure</option>    
                                <option value="Science fiction">Science fiction</option>
                                <option value="Drama">Drama</option>
                                <option value="Romance">Romance</option>
                                <option value="Superheros">Superheros</option>
                                <option value="Suspense">Suspense</option>  
                                <option value="Horror">Horror</option>  
                            </select><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="edad">Age:</label>
                            <input type="number" name="edad" id="edad" min="1" required /><br /><br />
                        </div>
                        <button class="btn btn-primary mt-2" type="submit" value="Guardar" >Create</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-6  mt-5">
            <c:if test="${not empty Pelis}">
                <table style=" text-align: center">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Age</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${Pelis}" var="pro">
                            <c:if test="${pro.getNombre() != null}">
                                <tr>
                                    <td scope="row">${pro.getNombre()}</td>
                                    <td scope="row">${pro.getGenero()}</td>
                                    <td scope="row">${pro.getEdad()}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
<%@include  file="footer.jsp" %>
