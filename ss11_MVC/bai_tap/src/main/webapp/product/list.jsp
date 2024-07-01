<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 7/1/2024
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <table class="table table-hover m-75 mx-auto text-center">
        <thead>
        <tr>
            <th colspan="5" class="text-center"><h1>Danh Sách Sản Phẩm</h1></th>
        </tr>
        <tr class="align-baseline">
            <th>ID</th>
            <th>Tên Sản Phẩm</th>
            <th>Mô Tả</th>
            <th>Nhà Sản Xuất</th>
            <th><button type="button" class="btn btn-primary">Thêm Mới</button></th>
        </tr>
        </thead>
        <tbody class="align-baseline">
        <c:forEach var="products" items="${products}">
            <tr>
                <td>${products.id}</td>
                <td>${products.name}</td>
                <td>${products.description}</td>
                <td>${products.manufacturer}</td>
                <td>
                    <button type="button" class="btn btn-success">Chỉnh Sửa</button>
                    <button type="button" class="btn btn-danger">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
