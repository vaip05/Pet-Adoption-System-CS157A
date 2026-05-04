package com.cs157a.petadoption.dao;

import com.cs157a.petadoption.model.Adopter;
import com.cs157a.petadoption.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdopterDAO {

    public List<Adopter> findAll() {
        String sql = "SELECT adopter_id, full_name, address, phone_number, email FROM adopters ORDER BY adopter_id";
        return runQuery(sql);
    }

    public List<Adopter> search(String keyword) {
        List<Adopter> adopters = new ArrayList<>();

        String sql = """
                SELECT adopter_id, full_name, address, phone_number, email
                FROM adopters
                WHERE LOWER(full_name) LIKE ?
                   OR LOWER(address) LIKE ?
                   OR LOWER(phone_number) LIKE ?
                   OR LOWER(email) LIKE ?
                ORDER BY adopter_id
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
                    adopters.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error searching adopters.", e);
        }

        return adopters;
    }

    private List<Adopter> runQuery(String sql) {
        List<Adopter> adopters = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                adopters.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching adopters.", e);
        }

        return adopters;
    }

    private Adopter mapRow(ResultSet rs) throws SQLException {
        Adopter adopter = new Adopter();
        adopter.setAdopterId(rs.getInt("adopter_id"));
        adopter.setFullName(rs.getString("full_name"));
        adopter.setAddress(rs.getString("address"));
        adopter.setPhoneNumber(rs.getString("phone_number"));
        adopter.setEmail(rs.getString("email"));
        return adopter;
    }
}