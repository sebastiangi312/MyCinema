<%@include file="header.jsp" %>


<div class="container">
    <div class="row">
        <button class=" col-12 col-lg-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-12 col-lg-7 d-flex mt-2 justify-content-center">Bill</h1>
    </div>
    <div class="row align-items-start">
        <div class="col-12 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Bill Id:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">${factura.getId()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Full Name:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">${factura.getComprador()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Movie:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                ${factura.getTiquete().get(0).getFuncion().getPelicula().getNombre()}
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Room:</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                ${factura.getTiquete().get(0).getFuncion().getSala().getNumeroSala()}
                            </p>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Time</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                ${factura.getTiquete().get(0).getFuncion().getHoraDeFuncion()}
                            </p>
                        </div>
                        <div class="row">
                            <h3 class="col-12 d-flex mt-2 justify-content-center">Tickets</h3>
                        </div>
                        <div class="row">
                            <c:forEach items="${factura.getTiquete()}" var="T">
                            <h5 class="col-12 col-lg-5">Ticket id: ${T.getID()}</h5>
                            <p class="col-12 col-lg-7 d-flex mt-auto justify-content-end">
                                Seat: ${T.getSilla()}, $${T.getPrecio()}
                            </p>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <h5 class="col-12 col-lg-5">Amount to be paid: $${factura.getPrecio()}</h5>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>