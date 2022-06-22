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
    <title>Flug buchen</title>

    <link href="css/style.css" rel="stylesheet">
</head>

<body>

<%
String vorname=(String)session.getAttribute("user");
out.print("Hello "+vorname);
%>
<h1> Bitte Daten eingeben </h1>

<form action="buchungsdaten.jsp" method="post">
    <input type="hidden" name="flugnrx" value='<%= request.getParameter("flugx")%>' />
    <fieldset>
        <br>
        <caption><br>PassagierNr</br></caption>
        <input type="text" name="passagiernr"/>
        <br>
        <br>
        <caption><br>Sozialversicherungsnummer</br></caption>
        <input type="text" name="sozialversicherungsnummer2"/>
        <br>
        <br>
        <caption><br>Geburtsdatum</br></caption>
        <input type="text" name="geburtsdatum2"/>
        <br>
        <br>
        <input type="submit" value="Speichern"/>
    </fieldset>


            <sql:query
            var="check1"
            sql="select vorname from person where
            vorname=?
            and svnr=?
            and geburtsdatum=(TO_TIMESTAMP(?, 'DD-MM-YYYY HH24:MI'))">
            <sql:param value='<%= (String)session.getAttribute("user")%>'/>
            <sql:param value="${param.sozialversicherungsnummer2}"/>
            <sql:param value="${param.geburtsdatum2}"/>
            </sql:query>

        <c:if test="${param.passagiernr != null && param.sozialversicherungsnummer2 != null && param.geburtsdatum2 != null}">

            <c:if test="${check1.rows[0] == null}">
            <font color="red">Only the logged in user can book a flight</font>
            </c:if>

            <c:if test="${check1.rows[0] != null}">
            <sql:update
            var="passagieranlegen"
            sql="insert into Passagiere values (?, ?, (TO_TIMESTAMP(?, 'DD-MM-YYYY HH24:MI')))">
            <sql:param value="${param.passagiernr}"/>
            <sql:param value="${param.sozialversicherungsnummer2}"/>
            <sql:param value="${param.geburtsdatum2}"/>
            </sql:update>
            </c:if>

        </c:if>

</form>
<br>

<form action="buchungsdaten.jsp" method="post">
    <input type="hidden" name="flugnrxx" value='<%= request.getParameter("flugnrx")%>' />
    <input type="hidden" name="passagiernrxx" value='<%= request.getParameter("passagiernr")%>' />

    <fieldset>
        <br>
        <caption><br>BuchungsNr</br></caption>
        <input type="text" name="buchungsnr"/>
        <br>
        <br>
        <caption><br>Klasse</br></caption>
        <input type="text" name="klasse"/>
        <br>
        <br>
        <input type="submit" value="Buchen"/>
    </fieldset>


     <sql:query
            var="check2"
            sql="select vorname from person where SVNR in
            (select SVNR from passagiere where vorname=?)">
            <sql:param value='<%= (String)session.getAttribute("user")%>'/>
     </sql:query>


    <c:if test="${param.buchungsnr != null && param.klasse != null}">

        <c:if test="${check2.rows[0] == null}">
            <font color="red">Only the logged in user can book a flight</font>
        </c:if>

        <c:if test="${check2.rows[0] != null}">
        <sql:update
                var="passagierbuchen"
                sql="insert into buchen values (?, ?, ?,(CURRENT_TIMESTAMP), ?)">
                <sql:param value="${param.buchungsnr}"/>
                <sql:param value='<%= request.getParameter("passagiernrxx")%>' />
                <sql:param value='<%= request.getParameter("flugnrxx")%>' />
                <sql:param value="${param.klasse}"/>
        </sql:update>
        <c:redirect url="gebucht.jsp"></c:redirect>
        </c:if>

    </c:if>

</form>
</body>
</html>