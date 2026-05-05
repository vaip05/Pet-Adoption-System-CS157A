<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Adopter</title>
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

<div class="container form-container">
    <h1>Add Adopter</h1>
    <p class="lead">Enter adopter information below.</p>

    <form method="post" action="<%= request.getContextPath() %>/adopters">
        <label>Full Name</label>
        <input type="text" name="fullName" required>

        <label>Address</label>
        <input type="text" name="address" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNumber" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <div class="form-actions">
            <a class="button secondary" href="<%= request.getContextPath() %>/adopters">Cancel</a>
            <button type="submit">Save Adopter</button>
        </div>
    </form>
</div>

</body>
</html>