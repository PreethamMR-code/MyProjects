<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Donor | Red Cross</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="bg-light">

<!-- HEADER -->
<nav class="navbar navbar-expand-lg bg-white border-bottom border-danger border-2 px-4">
    <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="${pageContext.request.contextPath}/assets/redcross-logo.png"
             height="40" class="me-2">
        <strong>Blood Services</strong>
    </a>
</nav>

<!-- MAIN -->
<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-sm">
                <div class="card-header bg-danger text-white fw-bold">
                    Update Donor Account
                </div>

                <div class="card-body">

                    <!-- Update Form -->
                    <form method="post" action="updateDonor">

                        <!-- Email (READ ONLY - unique key) -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email"
                                   class="form-control"
                                   name="email"
                                   value="${donor.email}"
                                   readonly>
                        </div>

                        <!-- First Name -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">First Name</label>
                            <input type="text"
                                   class="form-control"
                                   name="firstName"
                                   value="${donor.firstName}"
                                   required>
                        </div>

                        <!-- Last Name -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Last Name</label>
                            <input type="text"
                                   class="form-control"
                                   name="lastName"
                                   value="${donor.lastName}"
                                   required>
                        </div>

                        <!-- Date of Birth -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Date of Birth</label>
                            <input type="date"
                                   class="form-control"
                                   name="dob"
                                   value="${donor.dob}"
                                   required>
                        </div>

                        <!-- ZIP Code -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">ZIP Code</label>
                            <input type="text"
                                   class="form-control"
                                   name="zipCode"
                                   value="${donor.zipCode}"
                                   required>
                        </div>

                        <!-- Submit -->
                        <button type="submit" class="btn btn-danger w-100">
                            Update Account
                        </button>

                    </form>

                    <!-- Success Message -->
                    <c:if test="${not empty success}">
                        <div class="alert alert-success mt-3">
                            ${success}
                        </div>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3">
                            ${error}
                        </div>
                    </c:if>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- FOOTER -->
<footer class="text-center border-top py-3 bg-white mt-5">
    <span class="fw-bold">1-800-RED-CROSS (1-800-733-2767)</span>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
