<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Simple Dictionary</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<form action="dictionary.jsp" method="post" class="w-25 mt-5 mx-auto">
  <div class="mb-3">
    <label for="search" class="form-label">Vietnamese Dictionary: </label>
    <input type="text" class="form-control" id="search" placeholder="Enter your word: " name="search">
  </div>
  <button type="submit" class="btn btn-primary">Search</button>
</form>
</body>
</html>