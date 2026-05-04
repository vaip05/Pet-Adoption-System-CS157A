<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shelters</title>
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

<div class="container">
    <div class="toolbar">
        <div>
            <h1>Shelters</h1>
            <p class="lead">View shelter contact information</p>
        </div>
    </div>

    <div class="search-card">
        <form class="search-form" method="get" action="<%= request.getContextPath() %>/shelters">
            <input type="text" name="search" placeholder="Search shelters by name, location, or email">
            <button type="submit">Search</button>
            <a class="button secondary" href="<%= request.getContextPath() %>/shelters">Clear</a>
        </form>
    </div>

    <div class="table-card">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Location</th>
                <th>Contact Number</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="shelter" items="${shelters}">
                <tr>
                    <td>${shelter.shelterId}</td>
                    <td>${shelter.shelterName}</td>
                    <td>${shelter.location}</td>
                    <td>${shelter.contactNumber}</td>
                    <td>${shelter.email}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>