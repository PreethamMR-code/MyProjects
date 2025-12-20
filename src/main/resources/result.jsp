<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>registered Details Result</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex flex-column" style="min-height:100vh;">

<!-- HEADER -->
<header class="bg-dark text-white text-center py-3">
    <h3 class="mb-0">IPL Player Registered Details</h3>
</header>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">IPL Bidding</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="registration.jsp">Register Player</a></li>
                <li class="nav-item"><a class="nav-link" href="company.jsp">Bidding</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container col-md-6 mt-5">

    <h3 class="text-center mb-4 text-primary">registration Details Submitted</h3>

    <div class="border p-4 rounded shadow-sm bg-white">

        <!-- Success / Failure Messages -->
        <h1>
            <p style="color: green"><strong>${success}</strong></p>
            <p style="color: red"><strong>${fail}</strong></p>
        </h1>

        <!-- Display Data -->
        <p><strong>Player Name :</strong> ${playerName}</p>
        <p><strong>Age :</strong> ${age}</p>
        <p><strong>Player Type:</strong> ${playerType}</p>
        <p><strong>Batting Avg:</strong> ${battingAvg}</p>
        <p><strong>bowling Avg:</strong> ${bowlingAvg}</p>
        <p><strong>Stumping:</strong> ${stumpings}</p>
        <p><strong>State:</strong> ${state}</p>


        <!-- Button -->
        <div class="mt-4 text-center">
            <a href="registration.jsp" class="btn btn-primary">Go Back</a>
        </div>

    </div>

</div>
<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-5">
    <small>© 2025 IPL Bidding System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
