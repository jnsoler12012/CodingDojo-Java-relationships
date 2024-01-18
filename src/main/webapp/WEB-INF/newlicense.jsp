<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New License</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
    <div id="container-fluid">
		<div>
			<h1>New License</h1>
			<form:form action="/addlicense" method="post" modelAttribute="licenseObject">
				<h2>
			        <form:label path="person">Person:</form:label>
			        <form:select  path="person">
						<c:forEach items="${personslist}" var="per">
							<form:option value="${per.id}"><c:out value="${per.firstName} ${per.lastName}"/></form:option>
						</c:forEach>
					</form:select>
			    </h2>	  
			    <h2>
			        <form:label path="state">State:</form:label>
    			    <form:select  path="state">
						<c:forEach items="${states}" var="state">
							<form:option value="${state}"><c:out value="${state}"/></form:option>
						</c:forEach>
					</form:select>
			    </h2>
			    <h2>
			        <form:label path="expiration_date">Expiration Date:</form:label>
			        <form:input  type="date" path="expiration_date"/>
			    </h2>
			    <input id="btn" type="submit" value="Create"/>	 
			</form:form>
		</div>
		<div>
		<form:errors cssClass="red" path="licenseObject.*"/>
		</div>
	</div>
</body>
</html>