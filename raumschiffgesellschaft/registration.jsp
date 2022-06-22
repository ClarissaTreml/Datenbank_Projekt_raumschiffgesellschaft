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
    <title>Sign up</title>

    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<h1> Please Register </h1>

<form action="registration.jsp" method="post">
    <fieldset>
        <caption><br>Vorname</br></caption>
        <input type="text" name="vorname" />
        <br>
        <caption><br>Nachname</br></caption>
        <input type="text" name="nachname"/>
        <br>
        <br>
        <caption><br>Sozialversicherungsnummer</br></caption>
        <input type="text" name="sozialversicherungsnummer" />
        <br>
        <caption><br>Geburtsdatum</br></caption>
        <input type="text" name="geburtsdatum" />
        <br>
        <br>
        <caption><br>Strasse</br></caption>
        <input type="text" name="strasse" />
        <caption><br>Hausnummer</br></caption>
        <input type="text" name="hausnummer" />
        <br>
        <br>
        <caption><br>Ort</br></caption>
        <input type="text" name="ort" />
        <br>
        <caption><br>Platz</br></caption>
        <input type="text" name="platz" />
        </fieldset>
        <fieldset>
            <input type="submit" value="Sign Up"/>
        </fieldset>
        <c:if test="${param.vorname != null && param.nachname != null
        && param.sozialversicherungsnummer != null && param.geburtsdatum}">

        <sql:update
            var="persons"
            sql="insert
            into Person values (?,(TO_TIMESTAMP(?, 'DD-MM-YYYY HH24:MI')), ?,
            ?, ?, ?, ?, ?)">
            <sql:param value="${param.sozialversicherungsnummer}"/>
            <sql:param value="${param.geburtsdatum}"/>
            <sql:param value="${param.vorname}"/>
            <sql:param value="${param.nachname}"/>
            <sql:param value="${param.platz}"/>
            <sql:param value="${param.ort}"/>
            <sql:param value="${param.strasse}"/>
            <sql:param value="${param.hausnummer}"/>
        </sql:update>
         <c:redirect url="loginuser.jsp"></c:redirect>
        </c:if>
</form>


</body>
</html>