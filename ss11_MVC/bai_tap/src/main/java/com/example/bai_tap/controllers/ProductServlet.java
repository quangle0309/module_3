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

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/product/create.jsp").forward(req, resp);
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("idUpdate", idUpdate);
                req.getRequestDispatcher("/product/update.jsp").forward(req, resp);
                break;
            case "search":
                String keyword = req.getParameter("keyword");
                List<Product> searchProducts = productService.searchByName(keyword);
                req.setAttribute("searchProducts", searchProducts);
                req.getRequestDispatcher("/product/search.jsp").forward(req, resp);
                break;
            default:
                List<Product> products = productService.findAll();
                req.setAttribute("products", products);
                req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
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
                String name = req.getParameter("name");
                String description = req.getParameter("description");
                String manufacturer = req.getParameter("manufacturer");
                Product product = new Product(name, description, manufacturer);
                productService.add(product);
                resp.sendRedirect("/product");
                break;
            case "delete":
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
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                String updatedName = req.getParameter("name");
                String updatedDescription = req.getParameter("description");
                String updatedManufacturer = req.getParameter("manufacturer");
                boolean isUpdated = productService.updateProduct(idUpdate, updatedName, updatedDescription, updatedManufacturer);
                if (isUpdated) {
                    resp.sendRedirect("/product");
                } else {
                    req.setAttribute("message", "Cập nhật không thành công!!!");
                    List<Product> products = productService.findAll();
                    req.setAttribute("products", products);
                    req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
                }
                break;
            default:
                break;
        }
    }
}
