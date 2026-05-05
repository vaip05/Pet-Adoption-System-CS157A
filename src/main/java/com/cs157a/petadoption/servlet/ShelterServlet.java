package com.cs157a.petadoption.servlet;

import com.cs157a.petadoption.dao.ShelterDAO;
import com.cs157a.petadoption.model.Shelter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/shelters")
public class ShelterServlet extends HttpServlet {
    private final ShelterDAO shelterDAO = new ShelterDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String search = req.getParameter("search");

        if ("new".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/views/shelter-form.jsp").forward(req, resp);
            return;
        }

        if (search != null && !search.trim().isEmpty()) {
            req.setAttribute("shelters", shelterDAO.search(search.trim()));
            req.setAttribute("search", search.trim());
        } else {
            req.setAttribute("shelters", shelterDAO.findAll());
        }

        req.getRequestDispatcher("/WEB-INF/views/shelters.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Shelter shelter = new Shelter();

        shelter.setShelterName(req.getParameter("shelterName"));
        shelter.setLocation(req.getParameter("location"));
        shelter.setContactNumber(req.getParameter("contactNumber"));
        shelter.setEmail(req.getParameter("email"));

        shelterDAO.insert(shelter);

        resp.sendRedirect(req.getContextPath() + "/shelters");
    }
}