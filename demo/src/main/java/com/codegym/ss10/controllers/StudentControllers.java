package com.codegym.ss10.controllers;

import com.codegym.ss10.models.Student;
import com.codegym.ss10.services.IStudentService;
import com.codegym.ss10.services.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/student")
public class StudentControllers extends HttpServlet {

    private static IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = studentService.findAll();
        req.setAttribute("students", students);
        req.getRequestDispatcher("/student/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}