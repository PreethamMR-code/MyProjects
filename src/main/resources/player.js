function showFields() {
    const type = document.getElementById("playerType").value;

    // Hide all optional fields first
    document.getElementById("battingAvgDiv").classList.add("d-none");
    document.getElementById("bowlingAvgDiv").classList.add("d-none");
    document.getElementById("stumpingDiv").classList.add("d-none");

    // Show fields based on player type
    if (type === "batter") {
        document.getElementById("battingAvgDiv").classList.remove("d-none");
    }
    else if (type === "bowler") {
        document.getElementById("bowlingAvgDiv").classList.remove("d-none");
    }
    else if (type === "allrounder") {
        document.getElementById("battingAvgDiv").classList.remove("d-none");
        document.getElementById("bowlingAvgDiv").classList.remove("d-none");
    }
    else if (type === "keeper") {
        document.getElementById("battingAvgDiv").classList.remove("d-none");
        document.getElementById("stumpingDiv").classList.remove("d-none");
    }
}
