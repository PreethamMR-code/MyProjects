<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IPL Bidding</title>
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="registration.jsp">Register Player</a></li>
                <li class="nav-item"><a class="nav-link active" href="company.jsp">Bidding</a></li>
                <li class="nav-item ms-3">
                    <span class="navbar-text text-white fw-semibold">
                        Welcome, ${sessionScope.companyDTO.companyName}
                    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ================= MAIN ================= -->
<main class="container my-5 flex-grow-1">

    <!-- SUCCESS/ERROR MESSAGES (Global) -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show mx-4" role="alert">
            <strong>Success:</strong> ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show mx-4" role="alert">
            <strong>Error:</strong> ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- ===== SEARCH FORM ===== -->
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg p-4">
                <h4 class="text-center mb-4 text-primary">Search Players</h4>
                <form action="searchPlayers" method="get">
                    <div class="mb-3">
                        <label class="form-label">Player Type</label>
                        <select class="form-select" name="playerType" id="playerType" onchange="showFields()" required>
                            <option value="">-- Select Type --</option>
                            <option value="batter">Batter</option>
                            <option value="bowler">Bowler</option>
                            <option value="allrounder">All-Rounder</option>
                            <option value="keeper">Wicket Keeper</option>
                        </select>
                    </div>
                    <div class="mb-3 d-none" id="battingAvgDiv">
                        <label class="form-label">Batting Average</label>
                        <input type="number" step="0.01" min="0" value="0" class="form-control" name="battingAvg" placeholder="Enter batting average">
                    </div>
                    <div class="mb-3 d-none" id="bowlingAvgDiv">
                        <label class="form-label">Bowling Average</label>
                        <input type="number" step="0.01" min="0" value="0" class="form-control" name="bowlingAvg" placeholder="Enter bowling average">
                    </div>
                    <div class="mb-3 d-none" id="stumpingDiv">
                        <label class="form-label">Number of Stumpings</label>
                        <input type="number" min="0" value="0" class="form-control" name="stumpings">
                    </div>
                    <button type="submit" class="btn btn-success w-100">🔍 Search Player</button>
                </form>
            </div>
        </div>
    </div>

    <!-- ===== PLAYER LIST ===== -->
    <c:if test="${not empty players}">
        <div class="row mt-5">
            <div class="col">
                <h4 class="text-center text-primary mb-3">Available Players <span class="badge bg-light text-dark fs-6">${players.size()} found</span></h4>
                <table class="table table-bordered table-striped shadow">
                    <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Batting Avg</th>
                        <th>Bowling Avg</th>
                        <th>Stumpings</th>
                        <th>Bids</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${players}">
                        <tr>
                            <td><strong>${p.playerName}</strong></td>
                            <td><span class="badge bg-info">${p.playerType}</span></td>
                            <td>${p.battingAvg}</td>
                            <td>${p.bowlingAvg}</td>
                            <td>${p.stumpings}</td>
                            <td><span class="badge ${p.bidCount >= 3 ? 'bg-danger' : 'bg-warning'}">${p.bidCount}/3</span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.bidCount >= 3}">
                                        <span class="badge bg-success fs-6">
                                            ✅ Sold to ${p.soldTo}
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="bid.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="playerName" value="${p.playerName}">
                                            <button class="btn btn-success btn-sm" type="submit">Bid Now</button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

</main>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>© 2025 IPL Bidding System | Designed by Preetham</small>
</footer>

<!-- External JS only -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="player.js"></script>
</body>
</html>
