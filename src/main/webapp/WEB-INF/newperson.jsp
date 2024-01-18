<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/main.css">
    <title>New Person</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <div class="container-fluid">
        <div>
            <h1>New Person</h1>
            <form:form action="/addperson" method="post" modelAttribute="personObject">
                <h2>
                    <form:label cssClass="label left" path="firstName">First Name:</form:label>
                    <form:input cssClass="box" path="firstName" />
                </h2>
                <h2>
                    <form:label cssClass="label left" path="lastName">Last Name:</form:label>
                    <form:input cssClass="box" path="lastName" />
                </h2>
                <input id="btn" type="submit" value="Create" />
            </form:form>
        </div>
        <div>
            <form:errors cssClass="red" path="personObject.*" />
        </div>
    </div>
</body>

</html>