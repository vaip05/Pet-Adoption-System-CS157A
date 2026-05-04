package com.cs157a.petadoption.dao;

import com.cs157a.petadoption.model.AdoptionApplication;
import com.cs157a.petadoption.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public List<AdoptionApplication> findAll() {
        List<AdoptionApplication> applications = new ArrayList<>();

        String sql = """
                SELECT a.application_id, a.pet_id, a.adopter_id, a.application_date, a.status,
                       p.name AS pet_name, d.full_name AS adopter_name
                FROM adoption_applications a
                JOIN pets p ON a.pet_id = p.pet_id
                JOIN adopters d ON a.adopter_id = d.adopter_id
                ORDER BY a.application_id
                """;

        return runQuery(sql);
    }

    public List<AdoptionApplication> search(String keyword) {
        List<AdoptionApplication> applications = new ArrayList<>();

        String sql = """
                SELECT a.application_id, a.pet_id, a.adopter_id, a.application_date, a.status,
                       p.name AS pet_name, d.full_name AS adopter_name
                FROM adoption_applications a
                JOIN pets p ON a.pet_id = p.pet_id
                JOIN adopters d ON a.adopter_id = d.adopter_id
                WHERE LOWER(p.name) LIKE ?
                   OR LOWER(d.full_name) LIKE ?
                   OR LOWER(a.status) LIKE ?
                   OR LOWER(a.application_date) LIKE ?
                ORDER BY a.application_id
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String term = "%" + keyword.toLowerCase() + "%";
            stmt.setString(1, term);
            stmt.setString(2, term);
            stmt.setString(3, term);
            stmt.setString(4, term);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    applications.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error searching applications.", e);
        }

        return applications;
    }

    public AdoptionApplication findById(int applicationId) {
        String sql = """
                SELECT a.application_id, a.pet_id, a.adopter_id, a.application_date, a.status,
                       p.name AS pet_name, d.full_name AS adopter_name
                FROM adoption_applications a
                JOIN pets p ON a.pet_id = p.pet_id
                JOIN adopters d ON a.adopter_id = d.adopter_id
                WHERE a.application_id = ?
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, applicationId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching application by ID.", e);
        }

        return null;
    }

    public void insert(AdoptionApplication application) {
        String sql = "INSERT INTO adoption_applications (pet_id, adopter_id, application_date, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, application.getPetId());
            stmt.setInt(2, application.getAdopterId());
            stmt.setString(3, application.getApplicationDate());
            stmt.setString(4, application.getStatus());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error inserting application.", e);
        }
    }

    public void updateStatus(int applicationId, String status) {
        String sql = "UPDATE adoption_applications SET status = ? WHERE application_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, applicationId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating application status.", e);
        }
    }

    public void delete(int applicationId) {
        String sql = "DELETE FROM adoption_applications WHERE application_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, applicationId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting application.", e);
        }
    }

    private List<AdoptionApplication> runQuery(String sql) {
        List<AdoptionApplication> applications = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                applications.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching applications.", e);
        }

        return applications;
    }

    private AdoptionApplication mapRow(ResultSet rs) throws SQLException {
        AdoptionApplication application = new AdoptionApplication();
        application.setApplicationId(rs.getInt("application_id"));
        application.setPetId(rs.getInt("pet_id"));
        application.setAdopterId(rs.getInt("adopter_id"));
        application.setApplicationDate(rs.getString("application_date"));
        application.setStatus(rs.getString("status"));
        application.setPetName(rs.getString("pet_name"));
        application.setAdopterName(rs.getString("adopter_name"));
        return application;
    }
}