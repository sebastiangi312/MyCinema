<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>CINE</title> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        
        <div id="container">
            <table width="100%">
                <tr>
                    <td style="width : 70% "><h1>Cinema Nombre</h1></td>
                    
                    <c:if test="${sessionScope.aPersona  == null}">
                        <td  style=" width: 15% ; text-align: center">
                            <h4><a href="./Personas"> Registrarme </a></h4>
                        </td>

                        <td style=" width: 15% ; text-align: center">
                            <h4><a href="./LogIn"> Log In</a>
                        </td>
                    </c:if>
                    
                    <c:if test="${sessionScope.aPersona != null}">
                        <td style=" width: 20% ; text-align: center">
                            <h4><a href="./Perfil?Usuario="> ${sessionScope.aPersona.getNombre()} </a></h4>
                        </td>
                    </c:if>
                </tr>
            </table>
        <div id="body">