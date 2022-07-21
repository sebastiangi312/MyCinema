<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
       <div class="card col-12 col-lg-2 mt-3">
           <div class="card-body">
                <h5 class="card-title">Rooms</h5>
                <p class="card-text">Click the button below to add a new Room</p>
                <button class="btn btn-primary mt-5"   onclick="window.location.href='./Salas';">
                    Add new Rooms
                </button>
            </div>
        </div>
        <div class="col-lg-2"></div>
        <div class="card col-12 col-lg-2 mt-3 ms-2">
            <div class="card-body">
                <h5 class="card-title">Movies</h5>
                <p class="card-text">Click the button below to add a new movie</p>
                <button class="btn btn-success mt-5"   onclick="window.location.href='./Peliculas';">
                    Add new Movie
                </button>
            </div>
        </div>
        <div class="col-lg-2"></div>
        <div class="card col-12 col-lg-2 mt-3 ms-2">
            <div class="card-body">
                <h5 class="card-title">Showtimes</h5>
                <p class="card-text">Click the button below to add a new showtime for a movie</p>
                <button class="btn btn-danger"   onclick="window.location.href='./Funciones';">
                    Add New Showtimes
                </button>
            </div>
        <div class="col-2 "></div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2"></div>
       <div class="card col-12  col-lg-2 mt-3">
           <div class="card-body">
                <h5 class="card-title">Users</h5>
                <p class="card-text">Click the button below to read user list</p>
                <button class="btn btn-secondary mt-5 ms-4"   onclick="window.location.href='./Usuarios';">
                    List all users
                </button>
            </div>
        </div>
        <div class="col-lg-2"></div>
       <div class="card col-12  col-lg-2 mt-3">
            <div class="card-body">
                <h5 class="card-title">Data</h5>
                <p class="card-text">Click the button below to see interesting data</p>
                <button class="btn btn-success mt-5 ms-4"   onclick="window.location.href='./Datos';">
                    Get Data
                </button>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
