<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
       <div class="card col-lg-3 col-12 mt-3">
           <div class="card-body">
                <h5 class="card-title">Movies</h5>
                <p class="card-text">Click the button below to go to our catalog of movies</p>
                <button class="btn btn-primary"   onclick="window.location.href='./PeliculasUsuario';">
                    Go to Catalog
                </button>
            </div>
        </div>
    <div class="col-lg-3 col-12"></div>
        <c:if test="${sessionScope.aPersona  != null}">
        <div class="card col-lg-2 col-12 mt-3 ms-2">
            <div class="card-body">
                <h5 class="card-title">Vote Movie</h5>
                <p class="card-text">Click the button below to leave your vote for a movie</p>
                <button class="btn btn-info"   onclick="window.location.href='./VotarPeliculas';">
                    Vote Movie
                </button>
            </div>
        </div>
        </c:if>
    </div>
    <div class="row">
       <div class="card col-lg-3 col-12 mt-3">
           <div class="card-body">
    <h5 class="card-title">Credentials Client</h5>
    <p class="card-text">email: user@hotmail.com <br>password: user</p>
  </div>
  <div class="card-body">
    <h5 class="card-title">Credentials Admin</h5>
    <p class="card-text">email: admin@hotmail.com <br>password: admin</p>
  </div>
</div>
</div>
</div>
<%@include file="footer.jsp" %>
