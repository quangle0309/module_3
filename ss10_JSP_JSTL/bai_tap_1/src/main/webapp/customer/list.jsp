<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="customerStyle.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Logo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Khách hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">...</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">More</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <table class="table table-hover w-75 mx-auto mt-5">
        <thead>
        <tr>
            <th colspan="4" class="text-center"><h1>Danh Sách Khách Hàng</h1></th>
        </tr>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th class="text-center">Địa chỉ</th>
            <th class="text-center">Ảnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customers" items="${customers}">
            <tr style="height: 120px; vertical-align: middle;">
                <td>${customers.name}</td>
                <td>${customers.dob}</td>
                <td class="text-center">${customers.address}</td>
                <td class="text-center"><img width="80px" height="auto" src="${customers.linkImage}" alt="avatar"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>