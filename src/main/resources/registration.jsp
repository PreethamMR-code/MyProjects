<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex flex-column min-vh-100">

<!-- HEADER -->
<header class="bg-dark text-white text-center py-3">
    <h3 class="mb-0">IPL Player Registration</h3>
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

<!-- FORM -->
<main class="container my-5 flex-grow-1">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg p-4">
                <h4 class="text-center mb-4 text-primary">Player Information</h4>

                <form action="PlayerServlet" method="post">

                    <div class="mb-3">
                        <label class="form-label">Player Name</label>
                        <input type="text" class="form-control" name="playerName" placeholder="Enter your name" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Age</label>
                        <input type="number" class="form-control" name="age" placeholder="Enter Age" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Player Type</label>
                        <select class="form-select" name="playerType"
                                id="playerType" onchange="showFields()" required>
                            <option value="">-- Select Type --</option>
                            <option value="batter">Batter</option>
                            <option value="bowler">Bowler</option>
                            <option value="allrounder">All-Rounder</option>
                            <option value="keeper">Wicket Keeper</option>
                        </select>
                    </div>

                    <div class="mb-3 d-none" id="battingAvgDiv">
                        <label class="form-label">Batting Average</label>
                        <input type="number"
                               class="form-control"
                               name="battingAvg"
                               value="0"
                               step="0.01"
                               min="0"
                               placeholder="Enter batting average">
                    </div>

                    <div class="mb-3 d-none" id="bowlingAvgDiv">
                        <label class="form-label">Bowling Average</label>
                        <input type="number"
                               class="form-control"
                               name="bowlingAvg"
                               value="0"
                               step="0.01"
                               min="0"
                               placeholder="Enter bowling average">
                    </div>


                    <div class="mb-3 d-none" id="stumpingDiv">
                        <label class="form-label">Number of Stumpings</label>
                        <input type="number" class="form-control" value = "0" name="stumpings">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">State</label>
                        <input type="text" class="form-control" name="state" placeholder="Enter state" required>
                    </div>

                    <button type="submit" class="btn btn-success w-100">
                        Register Player
                    </button>

                </form>
            </div>

        </div>
    </div>
</main>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-3">
    <small>© 2025 IPL Bidding System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="player.js"></script>

</body>
</html>
