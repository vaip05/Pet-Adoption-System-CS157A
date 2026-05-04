<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pets</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css?v=21">
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

<div class="container">

    <c:if test="${not empty param.error}">
        <div class="alert error">${param.error}</div>
    </c:if>

    <c:if test="${not empty param.success}">
        <div class="alert success">${param.success}</div>
    </c:if>

    <div class="toolbar">
        <div>
            <h1>Pets</h1>
            <p class="lead">Manage all pet records</p>
        </div>
        <div class="actions">
            <a class="button" href="<%= request.getContextPath() %>/pets?action=new">Add New Pet</a>
            <a class="button secondary" href="<%= request.getContextPath() %>/pets?action=available">Available Only</a>
            <a class="button secondary" href="<%= request.getContextPath() %>/pets">Show All</a>
        </div>
    </div>

    <div class="search-card">
        <form class="search-form" method="get" action="<%= request.getContextPath() %>/pets">
            <input type="text" name="search" value="${search}" placeholder="Search pets by name, breed, or status">
            <button type="submit">Search</button>
            <a class="button secondary" href="<%= request.getContextPath() %>/pets">Clear</a>
        </form>
    </div>

    <div class="table-card">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Breed</th>
                <th>Gender</th>
                <th>Status</th>
                <th>Shelter</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="pet" items="${pets}">
                <tr>
                    <td>${pet.petId}</td>
                    <td>${pet.name}</td>
                    <td>${pet.age}</td>
                    <td>${pet.breed}</td>
                    <td>${pet.gender}</td>
                    <td><span class="badge">${pet.availabilityStatus}</span></td>
                    <td>${pet.shelterName}</td>
                    <td>
                        <a href="<%= request.getContextPath() %>/pets?action=edit&id=${pet.petId}">Edit</a>
                        |
                        <a href="<%= request.getContextPath() %>/pets?action=delete&id=${pet.petId}"
                           onclick="return confirm('Delete this pet?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>