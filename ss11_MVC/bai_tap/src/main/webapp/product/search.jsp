<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand" href="#">Logo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Danh Sách Sản Phẩm</a>
                </li>
            </ul>
            <form class="d-flex my-auto" role="search">
                <input class="form-control me-2" type="search" placeholder="Input name..." aria-label="Search" name="keyword">
                <button class="btn btn-outline-primary w-50" type="submit">Tìm Kiếm</button>
            </form>
        </div>
    </div>
</nav>
<div class="container">
    <p class="mt-5" style="color: red">${message}</p>
    <table class="table table-hover m-75 mx-auto text-center">
        <thead>
        <tr>
            <th colspan="5" class="text-center"><h1>Danh Sách Tìm Kiếm</h1></th>
        </tr>
        <tr class="align-baseline">
            <th>ID</th>
            <th>Tên Sản Phẩm</th>
            <th>Mô Tả</th>
            <th>Nhà Sản Xuất</th>
            <th>
                <button type="button" class="btn btn-primary" onclick="window.location.href='/product?action=create'">
                    Thêm Mới
                </button>
            </th>
        </tr>
        </thead>
        <tbody class="align-baseline">
        <c:forEach var="product" items="${searchProducts}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.manufacturer}</td>
                <td>
                    <form class="d-inline" action="/product" method="get">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="${product.id}">
                        <button type="submit" class="btn btn-secondary">Chỉnh Sửa</button>
                    </form>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalDelete${product.id}">
                        Xóa
                    </button>
                    <div class="modal fade" tabindex="-1" id="modalDelete${product.id}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Xóa Sản Phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p class="m-auto">Bạn có chắc chắn muốn xóa sản phẩm này!!!</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" name="cancel">Hủy</button>
                                    <form action="/product?action=delete" method="post">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                        <input type="hidden" name="id" value="${product.id}">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
