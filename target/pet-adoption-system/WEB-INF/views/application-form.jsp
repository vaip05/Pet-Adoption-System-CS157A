<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Application</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css?v=20">
</head>
<body>

<div class="navbar">
    <div class="nav-container">
        <a class="logo" href="<%= request.getContextPath() %>/home">PetFinder</a>
        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/home">Home</a>
            <a href="<%= request.getContextPath() %>/pets">Pets</a>
            <a href="<%= request.getContextPath() %>/applications">Applications</a>
            <a href="<%= request.getContextPath() %>/shelters">Shelters</a>
            <a href="<%= request.getContextPath() %>/adopters">Adopters</a>
        </div>
    </div>
</div>

<div class="container form-container">
    <h1>Submit Application</h1>
    <p class="lead">Create a new adoption application</p>

    <form method="post" action="<%= request.getContextPath() %>/applications">
        <label>Pet</label>
        <select name="petId" required>
            <c:forEach var="pet" items="${pets}">
                <option value="${pet.petId}">${pet.name} - ${pet.breed}</option>
            </c:forEach>
        </select>

        <label>Adopter</label>
        <select name="adopterId" required>
            <c:forEach var="adopter" items="${adopters}">
                <option value="${adopter.adopterId}">${adopter.fullName}</option>
            </c:forEach>
        </select>

        <label>Application Date</label>
        <input type="date" name="applicationDate" value="${today}" required>

        <label>Status</label>
        <select name="status" required>
            <option value="Pending">Pending</option>
            <option value="Approved">Approved</option>
            <option value="Rejected">Rejected</option>
        </select>

        <div class="form-actions">
            <a class="button secondary" href="<%= request.getContextPath() %>/applications">Cancel</a>
            <button type="submit">Submit Application</button>
        </div>
    </form>
</div>

</body>
</html>