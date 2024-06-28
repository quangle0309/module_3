<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<form action="converter.jsp" method="post" class="w-25 mt-5 mx-auto">
    <div class="mb-3">
        <label for="rate" class="form-label">Rate: </label>
        <input type="number" class="form-control" id="rate" placeholder="Rate" name="rate" value="22000">
    </div>
    <div class="mb-3">
        <label for="usd" class="form-label">USD: </label>
        <input type="number" class="form-control" id="usd" placeholder="USD" name="usd" value="0">
    </div>
    <button type="submit" class="btn btn-primary">Converter</button>
</form>
</body>
</html>