<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<form action="display-discount" method="post" class="w-50 m-auto">
  <div class="mb-3">
    <label for="productDescription" class="form-label">Product Description</label>
    <input type="text" class="form-control" id="productDescription" name="description">
  </div>
  <div class="mb-3">
    <label for="listPrice" class="form-label">List Price</label>
    <input type="text" class="form-control" id="listPrice" name="listPrice">
  </div>
  <div class="mb-3">
    <label for="discountPercent" class="form-label">Discount Percent</label>
    <input type="text" class="form-control" id="discountPercent" name="discountPercent">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
