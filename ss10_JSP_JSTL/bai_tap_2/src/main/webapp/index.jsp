<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="w-50 m-auto mt-5">
    <form action="calculator" method="post">
        <h2>Simple Calculator</h2>
        <div class="mb-3">
            <label for="first-operand" class="form-label">First Operand</label>
            <input type="number" id="first-operand" class="form-control" name="first-operand" pattern="[0-9]" minlength="1" required>
        </div>
        <div class="mb-3">
            <label for="operator" class="form-label">Operator</label>
            <select id="operator" class="form-select" name="operator">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="second-operand" class="form-label">Second Operand</label>
            <input type="number" id="second-operand" class="form-control" name="second-operand" pattern="[0-9]" minlength="1" required>
        </div>
        <div class="mb-3">
            <label for="result" class="form-label">Result</label>
            <input type="number" id="result" class="form-control" value="${result}" redonly>
        </div>
        <button type="submit" class="btn btn-primary">Calculate</button>
        <p class="text-danger">${message}</p>
    </form>
</div>
</body>
</html>
