<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${pet == null ? 'Add Pet' : 'Edit Pet'}</title>
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
    <h1>${pet == null ? 'Add Pet' : 'Edit Pet'}</h1>
    <p class="lead">Enter pet details below</p>

    <form method="post" action="<%= request.getContextPath() %>/pets">
        <input type="hidden" name="petId" value="${pet.petId}">

        <label>Name</label>
        <input type="text" name="name" value="${pet.name}" required>

        <label>Age</label>
        <input type="number" name="age" min="0" value="${pet.age}" required>

        <label>Breed</label>
        <input type="text" name="breed" value="${pet.breed}" required>

        <label>Gender</label>
        <select name="gender" required>
            <option value="Male" ${pet.gender == 'Male' ? 'selected' : ''}>Male</option>
            <option value="Female" ${pet.gender == 'Female' ? 'selected' : ''}>Female</option>
        </select>

        <label>Availability Status</label>
        <select name="availabilityStatus" required>
            <option value="Available" ${pet.availabilityStatus == 'Available' ? 'selected' : ''}>Available</option>
            <option value="Pending" ${pet.availabilityStatus == 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="Adopted" ${pet.availabilityStatus == 'Adopted' ? 'selected' : ''}>Adopted</option>
        </select>

        <label>Shelter</label>
        <select name="shelterId" required>
            <c:forEach var="shelter" items="${shelters}">
                <option value="${shelter.shelterId}" ${pet.shelterId == shelter.shelterId ? 'selected' : ''}>
                    ${shelter.shelterName}
                </option>
            </c:forEach>
        </select>

        <div class="form-actions">
            <a class="button secondary" href="<%= request.getContextPath() %>/pets">Cancel</a>
            <button type="submit">Save Pet</button>
        </div>
    </form>
</div>

</body>
</html>