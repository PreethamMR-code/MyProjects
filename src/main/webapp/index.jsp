<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>American Red Cross | Blood Services</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body class="bg-light">

<!-- HEADER -->
<nav class="navbar navbar-expand-lg bg-white border-bottom border-danger border-2 px-4">
    <a class="navbar-brand d-flex align-items-center" href="#">
       <img src="${pageContext.request.contextPath}/assets/redcross-logo.png">
        <strong>Blood Services</strong>
    </a>
</nav>

<!-- MAIN CONTENT -->
<div class="container text-center my-5">

    <h1 class="mb-4 fw-bold">Welcome to American Red Cross Blood Services</h1>
    <p class="mb-5 text-muted">
        Sign in to manage your donations or create an account to start saving lives today.
    </p>

    <div class="row justify-content-center">

        <!-- LOGIN CARD -->
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Account Login</h4>
                    <p class="card-text">
                        Already have an account?
                        Sign in to schedule appointments and manage donations.
                    </p>

                    <a href="accountLogin.jsp" class="btn btn-danger w-100">
                        Sign In
                    </a>
                </div>
            </div>
        </div>

        <!-- CREATE ACCOUNT CARD -->
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Create My Account</h4>
                    <p class="card-text">
                        New donor?
                        Create an account and help save lives through blood donation.
                    </p>

                    <a href="createMyAccount.jsp" class="btn btn-outline-danger w-100">
                        Create Account
                    </a>
                </div>
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
