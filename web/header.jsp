<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cinema</title> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    </head>
    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand ms-2" href="./Home">Home</a>
                <div class="float-end">
                    
                    <c:if test="${sessionScope.aPersona  == null}">
                        <button class="btn btn-outline-info"   onclick="window.location.href='./Personas';">
                         Register
                        </button> 
                        <button class="btn btn-outline-success"  onclick="window.location.href='./LogIn';">
                         Login
                        </button> 
                    </c:if>
                    <c:if test="${sessionScope.aPersona != null}">
                        <button class="btn btn-outline-warning"  onclick="window.location.href='./Perfil?Usuario=';">
                         ${sessionScope.aPersona.getNombre()}
                        </button> 
                    </c:if>
                </div>
            </div>
        </nav>