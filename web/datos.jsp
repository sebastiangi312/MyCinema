<%@include file="header.jsp" %>

<div class="container">
    <div class="row">
        <button class=" col-12 col-lg-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-12 col-lg-7 d-flex mt-2 justify-content-center">Data</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-12 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Person who used more money in the cinema:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                            <c:if test="${MayorD.getNombre()== null}">
                                No money used yet
                            </c:if>
                            <c:if test="${MayorD.getNombre()!= null}">
                                ${MayorD.getNombre()} : ${MayorD.getDineroUtilizado()}
                            </c:if>
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Last person to reserve seats:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                <c:if test="${factura.getComprador()== null}">
                                    Seats have not been reserved
                                </c:if>
                                <c:if test="${factura.getComprador()!= null}">
                                    ${factura.getComprador()} with the bill ${factura.getId()}
                                </c:if>
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Most attended movie:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                <c:if test="${PAsisMaxima.getNombre()== null}">
                                    No user has seen any movie
                                </c:if>
                                <c:if test="${PAsisMaxima.getNombre() != null}">
                                    ${PAsisMaxima.getNombre()} with ${AsisMaxima} people
                                </c:if>
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Lowest attended movie</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                <c:if test="${PAsisMinima.getNombre()== null}">
                                    No user has seen any movie
                                </c:if>
                                <c:if test="${PAsisMinima.getNombre() != null}">
                                    ${PAsisMaxima.getNombre()} with ${AsisMinima} people
                                </c:if>
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Best rated movie</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                <c:if test="${PVMaxima.getNombre()== null}">
                                    No movie has been rated
                                </c:if>
                                <c:if test="${PVMaxima.getNombre() != null}">
                                    ${PVMaxima.getNombre()} with ${valMaxima} points
                                </c:if>
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Worst rated movie</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                <c:if test="${PVMinima.getNombre()== null}">
                                    No movie has been rated
                                </c:if>
                                <c:if test="${PVMinima.getNombre() != null}">
                                    ${PVMinima.getNombre()} with ${valMinima} points
                                </c:if>
                            </p>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>