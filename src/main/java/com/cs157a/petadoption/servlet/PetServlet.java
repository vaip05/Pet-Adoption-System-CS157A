package com.cs157a.petadoption.servlet;

import com.cs157a.petadoption.dao.PetDAO;
import com.cs157a.petadoption.dao.ShelterDAO;
import com.cs157a.petadoption.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/pets")
public class PetServlet extends HttpServlet {
    private final PetDAO petDAO = new PetDAO();
    private final ShelterDAO shelterDAO = new ShelterDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String search = req.getParameter("search");

        if (action == null) {
            if (search != null && !search.trim().isEmpty()) {
                req.setAttribute("pets", petDAO.search(search.trim()));
                req.setAttribute("search", search.trim());
            } else {
                req.setAttribute("pets", petDAO.findAll());
            }

            req.getRequestDispatcher("/WEB-INF/views/pets.jsp").forward(req, resp);
            return;
        }

        switch (action) {
            case "new" -> {
                req.setAttribute("shelters", shelterDAO.findAll());
                req.getRequestDispatcher("/WEB-INF/views/pet-form.jsp").forward(req, resp);
            }

            case "edit" -> {
                int petId = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("pet", petDAO.findById(petId));
                req.setAttribute("shelters", shelterDAO.findAll());
                req.getRequestDispatcher("/WEB-INF/views/pet-form.jsp").forward(req, resp);
            }

            case "delete" -> {
                try {
                    int petId = Integer.parseInt(req.getParameter("id"));
                    petDAO.delete(petId);

                    String message = URLEncoder.encode(
                            "Pet deleted successfully.",
                            StandardCharsets.UTF_8
                    );

                    resp.sendRedirect(req.getContextPath() + "/pets?success=" + message);
                } catch (RuntimeException e) {
                    String message = URLEncoder.encode(
                            "Sorry cannot delete pet because there is currently an adoption application open for it.",
                            StandardCharsets.UTF_8
                    );

                    resp.sendRedirect(req.getContextPath() + "/pets?error=" + message);
                }
            }

            case "available" -> {
                req.setAttribute("pets", petDAO.findAvailablePets());
                req.getRequestDispatcher("/WEB-INF/views/pets.jsp").forward(req, resp);
            }

            default -> resp.sendRedirect(req.getContextPath() + "/pets");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("petId");

        Pet pet = new Pet();
        pet.setName(req.getParameter("name"));
        pet.setAge(Integer.parseInt(req.getParameter("age")));
        pet.setBreed(req.getParameter("breed"));
        pet.setGender(req.getParameter("gender"));
        pet.setAvailabilityStatus(req.getParameter("availabilityStatus"));
        pet.setShelterId(Integer.parseInt(req.getParameter("shelterId")));

        if (id == null || id.isBlank()) {
            petDAO.insert(pet);
        } else {
            pet.setPetId(Integer.parseInt(id));
            petDAO.update(pet);
        }

        resp.sendRedirect(req.getContextPath() + "/pets");
    }
}