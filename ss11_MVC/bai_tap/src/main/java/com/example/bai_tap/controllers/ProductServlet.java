package com.example.bai_tap.controllers;

import com.example.bai_tap.models.Product;
import com.example.bai_tap.services.IProductService;
import com.example.bai_tap.services.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "update":
                showFormUpdate(req, resp);
                break;
            case "search":
                searchProduct(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "update":
                updateProduct(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Product> searchProducts = productService.searchByName(keyword);
        req.setAttribute("searchProducts", searchProducts);
        req.getRequestDispatcher("/product/search.jsp").forward(req, resp);
    }

    private void showFormUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        String productName = req.getParameter("name");
        String productDescription = req.getParameter("description");
        String productManufacturer = req.getParameter("manufacturer");
        req.setAttribute("productId", productId);
        req.setAttribute("productName", productName);
        req.setAttribute("productDescription", productDescription);
        req.setAttribute("productManufacturer", productManufacturer);
        req.getRequestDispatcher("/product/update.jsp").forward(req, resp);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/product/create.jsp").forward(req, resp);
    }


    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String manufacturer = req.getParameter("manufacturer");
        Product product = new Product(name, description, manufacturer);
        productService.add(product);
        resp.sendRedirect("/product");
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int idDelete = Integer.parseInt(req.getParameter("id"));
        boolean isDelete = productService.removeById(idDelete);
        if (isDelete) {
            resp.sendRedirect("product");
        } else {
            req.setAttribute("message", "Xóa không thành công!!!");
            List<Product> products = productService.findAll();
            req.setAttribute("products", products);
            req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int idUpdate = Integer.parseInt(req.getParameter("id"));
        String updatedName = req.getParameter("name");
        String updatedDescription = req.getParameter("description");
        String updatedManufacturer = req.getParameter("manufacturer");
        boolean isUpdated = productService.updateProduct(new Product(idUpdate, updatedName, updatedDescription, updatedManufacturer));
        if (isUpdated) {
            resp.sendRedirect("/product");
        } else {
            req.setAttribute("message", "Cập nhật không thành công!!!");
            List<Product> products = productService.findAll();
            req.setAttribute("products", products);
            req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
        }
    }
}
