<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h2 class="mb-4">User Profile</h2>
    
    <h2><a href="/allusers">show all users</a></h2>
    
   	<c:if test="${userUpdatedMsg != null }">
        	<span style="color: red; background: beige;"><c:out value="${userUpdatedMsg }" /></span>
        </c:if>
    
    <form action="updateuser" method="post">
      <div class="row mb-3">
      <div class="col-md-6">
          
          <input type="hidden" class="form-control" name="id" value="${user.id }" id="id" required>
        </div>
        <div class="col-md-6">
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" name="name" value="${user.name }" id="name" required>
        </div>
        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" name="email" value="${user.email }" id="email" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="phone" class="form-label">Phone</label>
          <input type="tel" class="form-control" name="phone" value="${user.phone }" id="phone" required>
        </div>
        <div class="col-md-6">
          <label for="password" class="form-label">password</label>
          <input type="password" class="form-control" name="password" value="${user.password }" id="password" required>
        </div>
      </div>
      
          <div class="card">
      <div class="card-body">
      <h3>Address : </h3>
      <div class="col-md-4">
          <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox"  name="addresses[0].isPermanent" value="true" id="isPermanent" disabled="disabled">
        </div>
            <div class="row mb-3">
        <div class="col-md-6">
          
          <input type="hidden" class="form-control" name="addresses[0].id" value="${address1.id}" id="id" required>
        </div>
        <div class="col-md-6">
          
          <input type="hidden" class="form-control" name="addresses[0].user" value="${address1.user.id}" id="id" required>
        </div>     
        <div class="col-md-4">
          <label for="houseNo" class="form-label">House Number</label>
          <input type="text" class="form-control" name="addresses[0].houseNo" value="${address1.houseNo }"  id="houseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" name="addresses[0].houseName"  value="${address1.houseName }" id="buildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control" name="addresses[0].street" value="${address1.street }" id="street" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control" name="addresses[0].zipCode"  value="${address1.zipCode }" id="zipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control" name="addresses[0].city"  value="${address1.city }" id="city" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="addresses[0].country"  value="${address1.country }" id="country" required>
        </div>
      </div>
      </div>
      </div>
      <!-- permanent address -->
      <div class="card">
      <div class="card-body">
      <h3>Permanent Address : </h3>
      <div class="col-md-4">
          <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox"  name="addresses[1].isPermanent" value="true" id="isPermanent" checked="checked"           
           >
        </div>
            <div class="row mb-3">
         <div class="col-md-6">
          
          <input type="hidden" class="form-control" name="addresses[1].id" value="${address2.id }" id="id" required>
        </div>    
        <div class="col-md-6">
          
          <input type="hidden" class="form-control" name="addresses[1].user" value="${address2.user.id}" id="id" required>
        </div>
        <div class="col-md-4">
          <label for="houseNo" class="form-label">House Number</label>
          <input type="text" class="form-control" name="addresses[1].houseNo"  value="${address2.houseNo }" id="houseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" name="addresses[1].houseName"  value="${address2.houseName }" id="buildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control" name="addresses[1].street"  value="${address2.street }" id="street" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control" name="addresses[1].zipCode"  value="${address2.zipCode }" id="zipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control" name="addresses[1].city"  value="${address2.city }" id="city" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="addresses[1].country"  value="${address2.country }" id="country" required>
        </div>
      </div>
      </div>
      </div>

      <button type="submit" name="action"  class="btn btn-primary">Submit</button>
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

