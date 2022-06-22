<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
    driver="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521/xepdb1"
    user="csdc23vz_05"
    password="Tierai2o"
/>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/show.css" rel="stylesheet">
    <title>Gebucht</title>
</head>

<body>

    <sql:query
        var="buchungsdaten"
        sql="select * from person, flug, buchen where person.vorname=?">
        <sql:param value='<%= (String)session.getAttribute("user")%>'/>
    </sql:query>

    <%
    String vorname=(String)session.getAttribute("user");
    out.print("Hello "+vorname);
    %>
    <br>
    <h1>Ihr gebuchter Flug:</h1>
    <br>
    <br>
    Buchungsnummer: ${buchungsdaten.rows[0].buchungsnr}
    <br>
    <br>
    Vorname: ${buchungsdaten.rows[0].vorname}
    <br>
    Nachname: ${buchungsdaten.rows[0].nachname}
    <br>
    <br>
    Flugnummer: ${buchungsdaten.rows[0].flugnr}
    <br>
    <br>
    Abflugplanet: ${buchungsdaten.rows[0].abflugplanet}
    <br>
    Abflugzeit: ${buchungsdaten.rows[0].abflugzeit}
    <br>
    <br>
    Zielplanet: ${buchungsdaten.rows[0].zielplanet}
    <br>
    Ankunftzeit: ${buchungsdaten.rows[0].ankunftszeit}
    <br>
    <br>
    <br>

    <form action="index.jsp" method="POST">
        <%session.invalidate();%>
        <input type="submit" value="Zurueck zur Startseite"/>
    </form>
</body>
</html>