<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>PetFinder</title>
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
    <div class="hero">
        <h1>PetFinder</h1>
        <p>Manage pets, adopters, shelters, and adoption applications in one clean dashboard</p>
    </div>

    <div class="card-grid">
        <a class="card-link" href="<%= request.getContextPath() %>/pets">
            <div class="card">
                <h2>Manage Pets</h2>
                <p>View, add, update, delete, and filter pet records.</p>
            </div>
        </a>

        <a class="card-link" href="<%= request.getContextPath() %>/applications">
            <div class="card">
                <h2>Applications</h2>
                <p>Submit adoption applications and update their statuses.</p>
            </div>
        </a>

        <a class="card-link" href="<%= request.getContextPath() %>/shelters">
            <div class="card">
                <h2>Shelters</h2>
                <p>Browse shelter locations, contact numbers, and emails.</p>
            </div>
        </a>

        <a class="card-link" href="<%= request.getContextPath() %>/adopters">
            <div class="card">
                <h2>Adopters</h2>
                <p>View adopter records used in applications.</p>
            </div>
        </a>
    </div>
</div>

</body>
</html>