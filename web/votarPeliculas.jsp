<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./Home'">Back to Home</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">Movies</h1>
    </div>
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
                        <td scope="row"><a href="./VotarPeliculax?pelicula=${pro.getNombre()}">${pro.getNombre()}</a></td>
                        <td scope="row">${pro.getGenero()}</td>
                        <td scope="row">${pro.getEdad()}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="footer.jsp" %>