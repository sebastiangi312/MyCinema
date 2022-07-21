<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
        <button class=" col-1 btn btn-outline-primary me-2 mt-2"  onclick="window.location.href='./VotarPeliculas'">Back to Movies</button>
        <h1 class="col-7 d-flex mt-auto justify-content-center">Vote Movie</h1>
    </div>
    <div class="row align-items-center">
        <div class="col-4 mx-auto">
            <div class="card h-100 border-primary justify-content-center mt-5">
                <div class="card-body">
                    <form method="POST" action="./VotarPeliculax?pelicula=${pelicula.getNombre()}">
                        
                        <div class="row">
                            <h5 class="col-5">Name:</h5>
                            <p class="col-7 d-flex mt-auto justify-content-end">${pelicula.getNombre()}</p>
                        </div>
                        <div class="row">
                            <h5 class="col-5">Points:</h5>
                            <div class="col-7 d-flex mt-auto justify-content-end"">
                            <select name="voto">
                                <option value="1">1</option>
                                <option value="2">2</option> 
                                <option value="3">3</option> 
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select><br /><br />
                            </div>
                        </div>
                        <button class="btn btn-primary mt-2" type="submit" value="votar" >Create</button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>

<%@include file="footer.jsp" %>