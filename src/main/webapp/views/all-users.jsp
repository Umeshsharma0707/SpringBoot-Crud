<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Users</title>
    <!-- Bootstrap CSS -->
    <link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">All Users</h2>
      
     <span style="color: red; background: beige;">
     	<c:out value="${deleteMsg }"></c:out>
     </span>
        <c:if test="${idNotFound != null }">
        	<span style="color: red; background: beige;"><c:out value="${idNotFound }" /></span>
        </c:if>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                
                
                    <tr>
                        <th>User Id</th>
                        <th>User Name</th>
                        <th>User Phone</th>
                        <th>View/Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${not empty allUsers}">
                	<c:forEach var="user" items="${allUsers }">
               
                    <tr>
                        <td>${user.id }</td>
                        <td>${user.name }</td>
                        <td>${user.phone }</td>
                        <td><a href="/edit/${user.id }">view/edit</a></td>
                        <td><a href="/delete/${user.id }">delete</a></td>
                    </tr>
                    </c:forEach>
                     </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
