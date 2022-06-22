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
    <title>Flug anzeigen</title>

</head>

<body>
<%
String vorname=(String)session.getAttribute("user");
out.print("Hello "+vorname);
%>
<h1> Anzeigetafel </h1>
    <sql:query
            var="fluege"
            sql="select * from flug">
    </sql:query>

<ul>
    <c:forEach var="flug" begin="0" items="${fluege.rows}">
                <li>${flug.FlugNr}
                ${flug.Abflugplanet}
                ${flug.Zielplanet}
                ${flug.Abflugzeit}
                -
                ${flug.Ankunftszeit}</li>
    </c:forEach>

</ul>
<br>
<h1> Waehlen Sie Ihre Reise </h1>

    <sql:query
            var="abflug"
            sql="select distinct Abflugplanet from flug ">
    </sql:query>

    <sql:query
            var="ziel"
            sql="select distinct Zielplanet from flug ">
    </sql:query>




<br>

<form action="fluganzeigen.jsp" method="post">

    <select name="abfluege" size="1">
    <c:forEach var="flug" begin="0" items="${abflug.rows}">
    <option value="${flug.Abflugplanet}">${flug.Abflugplanet}</option>
    </c:forEach>
    </select>

    <select name="ziele" size="1">
    <c:forEach var="flug" begin="0" items="${ziel.rows}">
    <option value="${flug.Zielplanet}">${flug.Zielplanet}</option>
    </c:forEach>
    </select>

    <input type="submit" value="Flug buchen"/>

</form>

<sql:query
            var="matches"
            sql="select * from flug where Abflugplanet=? and Zielplanet=?">
            <sql:param value='<%= request.getParameter("abfluege")%>'/>
            <sql:param value='<%= request.getParameter("ziele")%>'/>
</sql:query>

<h1> Ihr Flug </h1>

<c:if test="${matches.rows[0] != null}">
    <form action="buchungsdaten.jsp" method="POST">

        <input type="hidden" value="${matches.rows[0].Flugnr}" name="flugx">

            ${matches.rows[0].Flugnr}
            <br>
            ${matches.rows[0].Abflugplanet}
            <br>
            ${matches.rows[0].Zielplanet}
            <br>
            ${matches.rows[0].Abflugzeit}
            <br>
            ${matches.rows[0].Ankunftszeit}
            <br>

            <input type="submit" value="Jetzt buchen" />

    </form>

</c:if>

<c:if test="${matches.rows[0] == null}">
            <p>No result found for this search</p>
</c:if>

</body>
</html>