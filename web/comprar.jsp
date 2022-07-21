<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./VerFuncion?funcionDePelicula=${pelicula}'">Back to Showtime</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">Buy Tickets</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-3">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                        <div class="row">
                            <h5 class="col-5">Movie Name:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end"> ${funcion.getPelicula().getNombre()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Room:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end"> ${funcion.getSala().getNumeroSala()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Format:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end"> ${funcion.getFormato()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Time</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end"> ${funcion.getHoraDeFuncion()}</p>
                        </div>
                </div>
            </div>
        </div>
        <div class="col-9 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="ms-2 mt-2">
                    <c:if test="${multiArreglo != null}">
                    <h4 class="card-title" >Select the seats you want to buy to watch the movie</h4>
                    <form method="POST" action="./Comprar?funcion=${peliculaHora}">
                        <c:forEach var="arreglo" items="${multiArreglo}">
                            <div class="card-body">
                                <c:forEach var="tiquete" items="${arreglo}">
                                    <c:if test="${sillasDisponibles.indexOf(tiquete.getSilla())>=0}">
                                        <input class="form-check-input mt-1 ms-2" type="checkbox" name="${tiquete.getSilla()}" value="${tiquete.getSilla()}">${tiquete.getSilla()}
                                    </c:if>
                                    
                                </c:forEach>
                            </div>
                        </c:forEach>
                        <input class="btn btn-outline-info" type="submit" value="Buy"/>
                    </form>
                </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>