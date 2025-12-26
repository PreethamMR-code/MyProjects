<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Login | American Red Cross</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<!-- HEADER -->
<nav class="navbar navbar-expand-lg bg-white border-bottom border-danger border-2 px-4">
    <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="${pageContext.request.contextPath}/assets/redcross-logo.png">
        <strong>Blood Services</strong>
    </a>

    <div class="ms-auto">
        <a href="#" class="me-3 text-decoration-none text-dark fw-bold">Find a Drive</a>
        <a href="#" class="text-decoration-none text-dark fw-bold">Sign In</a>
    </div>
</nav>

<!-- MAIN -->
<div class="container-fluid">
    <div class="row min-vh-100">

        <!-- LEFT FORM -->
        <div class="col-md-4 bg-light p-0">

            <div class="bg-danger text-white p-3 fs-5 fw-bold">
                Account Login
            </div>

            <div class="p-4">

                <!-- Blood Donor Login -->
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">Blood Donor Login</h5>

                        <form method="post" action="DonorLoginServlet">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Email or Username *</label>
                                <input type="text" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Password *</label>
                                <input type="password" class="form-control" required>
                            </div>

                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox">
                                <label class="form-check-label">Keep me signed in</label>
                            </div>

                            <button class="btn btn-danger w-100 mb-2">Sign In</button>

                            <div class="d-flex justify-content-between">
                                <a href="#" class="small">Forgot your Password?</a>
                                <a href="create-my-account.jsp" class="small">Create an Account</a>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- Program Leader Login -->
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">Blood Program Leader Login</h5>

                        <form method="post" action="LeaderLoginServlet">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Username *</label>
                                <input type="text" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Password *</label>
                                <input type="password" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Role</label>
                                <select class="form-select">
                                    <option>Blood Program Leader</option>
                                    <option>Account Manager</option>
                                </select>
                            </div>

                            <button class="btn btn-danger w-100 mb-2">Sign In</button>

                            <div class="d-flex justify-content-between">
                                <a href="#" class="small">Forgot your password?</a>
                                <a href="#" class="small">Need help logging in?</a>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>

        <!-- RIGHT IMAGE -->
        <div class="col-md-8 d-flex align-items-center justify-content-center bg-white">
            <img src="assets/redcross-heart.png" class="img-fluid w-75">
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
