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
    <title>Login</title>

    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<h1> Please Login </h1>
<form action="loginuser.jsp" method="post" input type=hidden >
    <fieldset>
        <caption><br>Name</br></caption>
        <input type="text" name="name" />
        <br>
        <br>
        <caption><br>SVNummer</br></caption>
        <input type="password" name="svnummer"/>
    </fieldset>

    <fieldset>
        <input type="submit" value="Login"/>
    </fieldset>

    <c:if test="${param.name != null && param.svnummer != null}">
        <sql:query
            var="users"
            sql="select count(*) from person where Vorname=? and SVNR=?">
            <sql:param value="${param.name}"/>
            <sql:param value="${param.svnummer}"/>
        </sql:query>

        <c:if test="${users.rowsByIndex[0][0] == 1}">
            <%String vorname =request.getParameter("name");
            session.setAttribute("user",vorname);
            %>
            <c:redirect url="fluganzeigen.jsp"></c:redirect>
        </c:if>

        <c:if test="${users.rowsByIndex[0][0] == 0}">
            <fieldset>
            <caption>Error: </caption>
            <font color="red">Invalid Credentials</font>
            </fieldset>
        </c:if>
    </c:if>
</form>

</body>
</html>