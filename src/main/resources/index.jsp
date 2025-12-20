<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IPL Bidding</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex flex-column" style="min-height:100vh;">

<!-- ================= HEADER ================= -->
<header class="bg-dark text-white text-center py-3">
    <h1 class="fw-bold mb-0">IPL Bidding System</h1>
    <p class="mb-0 small">Player Registration & Auction Management</p>
</header>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">IPL</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="registration.jsp">Register Player</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="company.jsp">Bidding</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ================= MAIN CONTENT ================= -->
<main class="container flex-grow-1 d-flex align-items-center">
    <div class="card shadow-lg mx-auto p-4 text-center"
         style="max-width: 600px; border-radius: 15px;">

        <h2 class="text-danger fw-bold mb-3">Welcome to IPL Bidding</h2>

        <p class="text-muted mb-4">Manage player registrations and bidding details</p>

        <hr>

        <!-- Registration -->
        <h4 class="text-primary mt-4 mb-3">Player Registration</h4>
        <a href="registration.jsp" class="btn btn-outline-primary w-100 mb-4">
            Register Player
        </a>

        <!-- Bidding -->
        <h4 class="text-primary mb-3">Bidding</h4>
        <a href="company.jsp" class="btn btn-outline-success w-100">
            Start Bidding
        </a>
    </div>
</main>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>
        © 2025 IPL Bidding System | Designed by Preetham
    </small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
