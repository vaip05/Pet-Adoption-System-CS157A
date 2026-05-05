<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Adopters</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css?v=22">
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
            <h1>Adopters</h1>
            <p class="lead">View and manage adopter information</p>
        </div>

        <div class="actions">
            <a class="button" href="<%= request.getContextPath() %>/adopters?action=new">Add Adopter</a>
        </div>
    </div>

    <div class="search-card">
        <form class="search-form" method="get" action="<%= request.getContextPath() %>/adopters">
            <input type="text" name="search" value="${search}" placeholder="Search by name, phone, or email">
            <button type="submit">Run Query</button>
            <a class="button secondary" href="<%= request.getContextPath() %>/adopters">Clear</a>
        </form>
    </div>

    <div class="table-card">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Email</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="adopter" items="${adopters}">
                <tr>
                    <td>${adopter.adopterId}</td>
                    <td>${adopter.fullName}</td>
                    <td>${adopter.address}</td>
                    <td>${adopter.phoneNumber}</td>
                    <td>${adopter.email}</td>
                </tr>
            </c:forEach>

            <c:if test="${empty adopters}">
                <tr>
                    <td colspan="5" style="text-align:center;">No adopters found.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>