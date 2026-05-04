<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Status</title>
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
    <h1>Update Status</h1>
    <p class="lead">Change the status of this adoption application</p>

    <form method="post" action="<%= request.getContextPath() %>/applications">
        <input type="hidden" name="mode" value="status">
        <input type="hidden" name="applicationId" value="${application.applicationId}">

        <label>Pet</label>
        <input type="text" value="${application.petName}" disabled>

        <label>Adopter</label>
        <input type="text" value="${application.adopterName}" disabled>

        <label>Status</label>
        <select name="status" required>
            <option value="Pending" ${application.status == 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="Approved" ${application.status == 'Approved' ? 'selected' : ''}>Approved</option>
            <option value="Rejected" ${application.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
        </select>

        <div class="form-actions">
            <a class="button secondary" href="<%= request.getContextPath() %>/applications">Cancel</a>
            <button type="submit">Update Status</button>
        </div>
    </form>
</div>

</body>
</html>