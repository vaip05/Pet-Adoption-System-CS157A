<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Shelter</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css?v=23">
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
    <h1>Add Shelter</h1>
    <p class="lead">Enter shelter information below.</p>

    <form method="post" action="<%= request.getContextPath() %>/shelters">
        <label>Shelter Name</label>
        <input type="text" name="shelterName" required>

        <label>Location</label>
        <input type="text" name="location" required>

        <label>Contact Number</label>
        <input type="text" name="contactNumber" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <div class="form-actions">
            <a class="button secondary" href="<%= request.getContextPath() %>/shelters">Cancel</a>
            <button type="submit">Save Shelter</button>
        </div>
    </form>
</div>

</body>
</html>