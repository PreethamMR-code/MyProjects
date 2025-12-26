<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create My Account | American Red Cross</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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


    <div class="ms-auto">
        <a href="search.jsp" class="me-3 text-decoration-none text-dark fw-bold">Search</a>
        <a href="#" class="text-decoration-none text-dark fw-bold">Sign In</a>
    </div>
</nav>

<!-- MAIN -->
<div class="container-fluid">
    <div class="row min-vh-100">

        <!-- LEFT FORM COLUMN -->
        <div class="col-md-4 bg-light p-0">

            <div class="bg-danger text-white p-3 fs-5 fw-bold">
                Create My Account
            </div>

            <div class="p-4">

                <form method="post" action="CreateRedCrossAccount">

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email Address <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" name="email" required>
                    </div>


                   <!-- Date of Birth -->
                   <div class="mb-3">
                       <label class="form-label fw-bold">
                           Date of Birth <span class="text-danger">*</span>
                       </label>
                       <input type="date" class="form-control" name="dob" required>
                   </div>



                    <!-- Donor ID -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Donor ID (optional)</label>
                        <input type="text" class="form-control" name="donorID">
                    </div>

                    <!-- First Name -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">First Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="firstName" required>
                    </div>

                    <!-- Last Name -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Last Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="lastName" required>
                    </div>

                    <!-- ZIP Code -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">ZIP Code <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="zipCode" required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" name="password" required>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Confirm Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" name="confirmPassword" required>
                    </div>

                    <!-- Submit -->
                    <button type="submit" class="btn btn-danger w-100 mt-2">
                        Create Account
                    </button>

                </form>

            </div>
        </div>



    </div>
</div>

<!-- FOOTER -->
<footer class="text-center border-top py-3 bg-white">
    <a href="#" class="me-3">Home</a>
    <a href="#" class="me-3">Eligibility Info</a>
    <a href="#" class="me-3">Email Us</a>
    <span class="fw-bold">1-800-RED-CROSS (1-800-733-2767)</span>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
