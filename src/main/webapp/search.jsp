<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Donor | Red Cross</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
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
</nav>

<!-- MAIN -->
<div class="container mt-5">

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-sm">
                <div class="card-header bg-danger text-white fw-bold">
                    Search Donor Account
                </div>

                <div class="card-body">

                    <!-- Search Form -->
                    <form method="get" action="searchDonor">



                        <div class="mb-3">
                            <label class="form-label fw-bold">
                                Donor Email <span class="text-danger">*</span>
                            </label>
                            <input type="email"
                                   class="form-control"
                                   name="email"
                                   placeholder="Enter donor email"
                                   required>
                        </div>

                        <button type="submit" class="btn btn-danger w-100">
                            Search
                        </button>
                    </form>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3">
                            ${error}
                        </div>
                    </c:if>

                    <!-- Search Result -->
                    <c:if test="${not empty donor}">
                        <div class="alert alert-success mt-3">
                            <h6>Donor Found</h6>
                             <p><b>Id:</b> ${donor.getDonorID()}</p>
                            <p><b>Name:</b> ${donor.getFirstName()} ${donor.lastName}</p>
                            <p><b>Email:</b> ${donor.email}</p>
                            <p><b>DOB:</b> ${donor.dob}</p>
                            <p><b>ZIP:</b> ${donor.zipCode}</p>
                        </div>
                    </c:if>

                    <!-- EDIT BUTTON -->
                            <form method="get" action="editDonor" class="mt-3">

                                <input type="hidden" name="email" value="${donor.email}"/>

                                <button type="submit" class="btn btn-primary w-100">
                                    Edit Donor
                                </button>
                            </form>

                          <%--  //delete using email
                            <form action="deleteDonor" method="get">
                                <input type="hidden" name="email" value="${donor.email}">
                                <button type="submit" class="btn btn-danger">
                                    Delete Donor
                                </button>
                            </form>
                            // delete using ID --%>
                            <form action="deleteDonor" method="get">
                                <input type="hidden" name="id" value="${donor.getDonorID()}">
                                <button type="submit" class="btn btn-danger">
                                    Delete
                                </button>
                            </form>



                </div>
            </div>

        </div>
    </div>

</div>

<!-- FOOTER -->
<footer class="text-center border-top py-3 bg-white mt-5">
    <span class="fw-bold">1-800-RED-CROSS (1-800-733-2767)</span>
</footer>

<!-- Bootstrap JS -->+
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
