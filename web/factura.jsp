<%@include file="header.jsp" %>
Factura:${factura}<br /><br />

Usuario:${factura.getComprador()}<br />
Numero de Factura:${factura.getId()}<br />
Nombre Pelicula:${factura.getTiquete().get(0).getFuncion().getPelicula().getNombre()}<br />
Hora Inicio Funcion:${factura.getTiquete().get(0).getFuncion().getHoraDeFuncion()}<br />


<c:forEach items="${factura.getTiquete()}" var="T">
   //////////////////////////////////////////////////// TIQUETE<br />
Silla num:${T.getSilla()}<br />
Precio tiquete:${T.getPrecio()}<br />
ID de tiquete:${T.getID()}<br /><br />

</c:forEach>


Total a Pagar: ${factura.getPrecio()}<br /><br />

<%@include file="footer.jsp" %>