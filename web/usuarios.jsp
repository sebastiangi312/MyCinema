<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">Users</h1>
    </div>
    <table style=" text-align: center">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <th scope="col">Age</th>
                <th scope="col">Type</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaRegistros}" var="persona">
                <tr>
                    <td scope="row">${persona.getNombre()}</td>
                    <td scope="row">${persona.getApellido()}</td>
                    <td scope="row">${persona.getCorreo()}</td>
                    <td scope="row">${persona.getEdad()}</td>
                    <td scope="row">${persona.getTipo()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


<%@include file="footer.jsp" %>
