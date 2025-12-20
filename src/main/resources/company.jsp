<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company</title>

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
<main class="container flex-grow-1 d-flex align-items-center">
    <div class="card shadow-lg mx-auto p-4 text-center"
         style="max-width: 600px; border-radius: 15px;">

        <h2 class="text-danger fw-bold mb-3">Welcome to IPL Bidding</h2>

        <p class="text-muted mb-4">Company bidding platform and bidding details</p>


        <form action="CompanyLogin" method="get">

            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder = "Enter the Company Email "required>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">
                    ${error}
                </div>
            </c:if>

            <button type="submit" class="btn btn-success w-100">
                Start Bidding
            </button>
        </form>



    </div>
</main>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>
        © 2025 IPL Bidding System | Designed by Preetham
    </small>
</footer>
</body>
</html>