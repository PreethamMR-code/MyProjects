<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Bid</title>
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
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="registration.jsp">Register Player</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="company.jsp">Bidding</a>
                </li>

                <!-- COMPANY NAME -->
                <li class="nav-item ms-3">
                    <span class="navbar-text text-white fw-semibold">
                        Welcome, ${sessionScope.companyDTO.companyName}
                    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="col-md-6 mx-auto">
        <div class="card shadow p-4">

            <h4 class="text-center text-primary mb-4">Place Your Bid</h4>

            <!-- SUCCESS/ERROR MESSAGES -->
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="placeBid" method="post">
                <div class="mb-3">
                    <label class="form-label">Player Name</label>
                    <input type="text"
                           class="form-control"
                           name="playerName"
                           value="${param.playerName}"
                           readonly>
                </div>

                <!-- ✅ HIDDEN COMPANY NAME - No UI clutter -->
                <input type="hidden" name="companyName" value="${sessionScope.companyDTO.companyName}">

                <div class="mb-3">
                    <label class="form-label">Bid Amount (in Millions ₹)</label>
                    <input type="number"
                           step="0.1"
                           min="0.1"
                           name="bidAmount"
                           class="form-control"
                           placeholder="e.g. 12.5"
                           required>
                </div>

                <button type="submit" class="btn btn-success w-100">🚀 Submit Bid</button>
            </form>

        </div>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>© 2025 IPL Bidding System | Designed by Preetham</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
