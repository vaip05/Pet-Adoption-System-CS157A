package com.cs157a.petadoption.servlet;

import com.cs157a.petadoption.dao.AdopterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/adopters")
public class AdopterServlet extends HttpServlet {
    private final AdopterDAO adopterDAO = new AdopterDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");

        if (search != null && !search.trim().isEmpty()) {
            req.setAttribute("adopters", adopterDAO.search(search.trim()));
            req.setAttribute("search", search.trim());
        } else {
            req.setAttribute("adopters", adopterDAO.findAll());
        }

        req.getRequestDispatcher("/WEB-INF/views/adopters.jsp").forward(req, resp);
    }
}