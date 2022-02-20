<%@include file="header.jsp" %>
<table style=" text-align: center">
    <tr>
        <th width="180">Pelicula</th>
        <th width="120">Votar:</th>

    </tr>
    <tr>
        <td>${pelicula.getNombre()}</td>
        <td>
            <form method="POST" action="./VotarPeliculax?pelicula=${pelicula.getNombre()}">
                <select name="voto">
                    <option value="1">1</option>
                    <option value="2">2</option> 
                    <option value="3">3</option> 
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <input type="submit" value="votar" />
                <td> 1 es muy mala y 5 es excelente</td>
            </form>
        </td>
    </tr>
</table>

<%@include file="footer.jsp" %>