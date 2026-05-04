package com.cs157a.petadoption.servlet;

import com.cs157a.petadoption.dao.AdopterDAO;
import com.cs157a.petadoption.dao.ApplicationDAO;
import com.cs157a.petadoption.dao.PetDAO;
import com.cs157a.petadoption.model.AdoptionApplication;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/applications")
public class ApplicationServlet extends HttpServlet {
    private final ApplicationDAO applicationDAO = new ApplicationDAO();
    private final PetDAO petDAO = new PetDAO();
    private final AdopterDAO adopterDAO = new AdopterDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String search = req.getParameter("search");

        if (action == null) {
            if (search != null && !search.trim().isEmpty()) {
                req.setAttribute("applications", applicationDAO.search(search.trim()));
                req.setAttribute("search", search.trim());
            } else {
                req.setAttribute("applications", applicationDAO.findAll());
            }

            req.getRequestDispatcher("/WEB-INF/views/applications.jsp").forward(req, resp);
            return;
        }

        switch (action) {
            case "new" -> {
                req.setAttribute("pets", petDAO.findAvailablePets());
                req.setAttribute("adopters", adopterDAO.findAll());
                req.setAttribute("today", LocalDate.now().toString());
                req.getRequestDispatcher("/WEB-INF/views/application-form.jsp").forward(req, resp);
            }
            case "edit" -> {
                int applicationId = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("application", applicationDAO.findById(applicationId));
                req.getRequestDispatcher("/WEB-INF/views/application-status-form.jsp").forward(req, resp);
            }
            case "delete" -> {
                applicationDAO.delete(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect(req.getContextPath() + "/applications");
            }
            default -> resp.sendRedirect(req.getContextPath() + "/applications");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mode = req.getParameter("mode");

        if ("status".equals(mode)) {
            int applicationId = Integer.parseInt(req.getParameter("applicationId"));
            String status = req.getParameter("status");

            applicationDAO.updateStatus(applicationId, status);
            resp.sendRedirect(req.getContextPath() + "/applications");
            return;
        }

        AdoptionApplication application = new AdoptionApplication();
        application.setPetId(Integer.parseInt(req.getParameter("petId")));
        application.setAdopterId(Integer.parseInt(req.getParameter("adopterId")));
        application.setApplicationDate(req.getParameter("applicationDate"));
        application.setStatus(req.getParameter("status"));

        applicationDAO.insert(application);
        resp.sendRedirect(req.getContextPath() + "/applications");
    }
}