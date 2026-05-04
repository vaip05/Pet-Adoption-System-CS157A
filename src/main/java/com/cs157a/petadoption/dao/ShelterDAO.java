package com.cs157a.petadoption.dao;

import com.cs157a.petadoption.model.Shelter;
import com.cs157a.petadoption.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShelterDAO {

    public List<Shelter> findAll() {
        String sql = "SELECT shelter_id, shelter_name, location, contact_number, email FROM shelters ORDER BY shelter_id";
        return runQuery(sql);
    }

    public List<Shelter> search(String keyword) {
        List<Shelter> shelters = new ArrayList<>();

        String sql = """
                SELECT shelter_id, shelter_name, location, contact_number, email
                FROM shelters
                WHERE LOWER(shelter_name) LIKE ?
                   OR LOWER(location) LIKE ?
                   OR LOWER(contact_number) LIKE ?
                   OR LOWER(email) LIKE ?
                ORDER BY shelter_id
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
                    shelters.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error searching shelters.", e);
        }

        return shelters;
    }

    private List<Shelter> runQuery(String sql) {
        List<Shelter> shelters = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                shelters.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching shelters.", e);
        }

        return shelters;
    }

    private Shelter mapRow(ResultSet rs) throws SQLException {
        Shelter shelter = new Shelter();
        shelter.setShelterId(rs.getInt("shelter_id"));
        shelter.setShelterName(rs.getString("shelter_name"));
        shelter.setLocation(rs.getString("location"));
        shelter.setContactNumber(rs.getString("contact_number"));
        shelter.setEmail(rs.getString("email"));
        return shelter;
    }
}