<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="container">
    <div class="row">
        <button class="col-12 col-lg-1 btn btn-outline-primary me-2 mt-2" onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-12 col-lg-7 d-flex mt-2 justify-content-center">ShowTimes</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-lg-4 col-12">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <h1 class="card-title d-flex mt-auto justify-content-center">Find Movie</h1>
                    <form method="POST" action="./PeliculasUsuario">
                        <div class="form-group mt-4">
                            <label  for="numSala">Search Movie:</label>
                            <input class="justify-content-end" type="text" name="pelibuscada" id="pelibuscada" required /><br /><br />
                        </div>
                        <div class="form-group mt-2">
                            <label for="numSillas">Type:</label>
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
                        <div class="form-group mt-4">
                            <label for="edad">Age:</label>
                            <input type="number" name="edad" id="edad" min="1" /><br /><br />
                        </div>
                        <button class="btn btn-primary mt-2" type="submit" value="Filtrar" >Filter</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6  col-12 mt-5">
            <c:set var="var" value="existe"/>  
            <c:if test="${not empty Pelis}">    
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Movie</th>
                            <th scope="col">Type</th>
                            <th scope="col">Age</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${Pelis}" var="pelicula">
                            <tr>
                                <td scope="row"><a href="./VerPelicula?pelicula=${pelicula.getNombre()}">${pelicula.getNombre()}</a></td>
                                <td scope="row">${pelicula.getGenero()}</td>
                                <td scope="row">${pelicula.getEdad()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty Pelis}">
                <p class="alert alert-warning">Movie not found</p>
            </c:if>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>