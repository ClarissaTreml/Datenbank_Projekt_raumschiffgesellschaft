<!DOCTYPE html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">
    <meta name="description" content="">
    <meta name="author" content="Gruppe 5">

    <title>Raumschiffgesellschaft</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/main.css" rel="stylesheet">
</head>

<body>
<%
String vorname=(String)session.getAttribute("user");
out.print("Hello "+ vorname);
%>
<div class="cover-container d-flex align-items-center h-100 p-5 mx-auto flex-column">
    <header class="masthead"><!-- mb-auto -->
        <div class="inner">
            <h1 class="masthead-brand">Raumschiffgesellschaft</h1>
            <img class="rounded float-right img-responsive masthead-img" src="images/logo2.png" alt="logo" title="logo" height="60" style="margin-left: 2rem"/>

            <nav class="nav navbar-static-top nav-masthead justify-content-center">
                <a class="nav-link ${empty param.menu ? 'active' : ''}" href="index.jsp" id="startmenu">Startseite</a>

                <div class="nav-item dropdown">
                    <a class="nav-link " href="registration.jsp" role="button">
                        Registration
                    </a>
                </div>


                <div class="nav-item dropdown">
                    <a class="nav-link " href="loginuser.jsp" role="button">
                        Login
                    </a>
                </div>

            </nav>

        </div>
    </header>
    <main role="main" class="inner cover">
        <c:if test="${!empty param.menu}">
            <jsp:include page="${param.menu}.jsp" />
        </c:if>
        <c:if test="${empty param.menu}">
            <h2>Willkommen bei der Raumschiffgesellschaft Webseite</h2>
            <br />
            <br />
            <p>Buchen Sie Ihr Raumfahrterlebnis
                Sind Sie bereit, an der Spitze dieser aufregenden neuen &Aumlra der Raumfahrt zu stehen? Ihr Abenteuer an den Rand des Weltraums erwartet Sie.
                Die f&uumlr 2024 geplanten ersten Fl&uumlge sind ausverkauft. Sichern Sie sich jetzt Ihren Platz in der Weltraumgeschichte und geh&oumlren Sie zu den Ersten, die den Planeten Erde aus einer v&oumlllig neuen Perspektive erkunden und neu entdecken.
            </p>

        </c:if>
    </main>

    <footer class="mastfoot mt-auto text-center">
        <div class="inner">
            <p><a href="mailto:raumschiffgesellschaft@hotmail.com" class="nav-link">
                Kontaktieren Sie uns:
                <img class="rounded img-responsive mastfoot-img" src="images/email.jpg" alt="contact us" title="contact us" />
            </a>
            </p>
        </div>
    </footer>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-3.3.1.slim.min.js"><\/script>')</script>
<script src="js/vendor/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
