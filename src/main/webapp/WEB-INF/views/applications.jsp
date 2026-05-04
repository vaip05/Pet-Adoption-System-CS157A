<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Applications</title>
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
            <h1>Adoption Applications</h1>
            <p class="lead">View and manage adoption application statuses</p>
        </div>
        <div class="actions">
            <a class="button" href="<%= request.getContextPath() %>/applications?action=new">Submit Application</a>
        </div>
    </div>

    <div class="search-card">
        <form class="search-form" method="get" action="<%= request.getContextPath() %>/applications">
            <input type="text" name="search" placeholder="Search by pet, adopter, or status">
            <button type="submit">Search</button>
            <a class="button secondary" href="<%= request.getContextPath() %>/applications">Clear</a>
        </form>
    </div>

    <div class="table-card">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Pet</th>
                <th>Adopter</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="application" items="${applications}">
                <tr>
                    <td>${application.applicationId}</td>
                    <td>${application.petName}</td>
                    <td>${application.adopterName}</td>
                    <td>${application.applicationDate}</td>
                    <td><span class="badge">${application.status}</span></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/applications?action=edit&id=${application.applicationId}">Update</a>
                        |
                        <a href="<%= request.getContextPath() %>/applications?action=delete&id=${application.applicationId}"
                           onclick="return confirm('Delete this application?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>