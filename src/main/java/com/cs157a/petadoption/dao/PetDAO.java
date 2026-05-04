package com.cs157a.petadoption.dao;

import com.cs157a.petadoption.model.Pet;
import com.cs157a.petadoption.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PetDAO {

    public List<Pet> findAll() {
        List<Pet> pets = new ArrayList<>();

        String sql = """
                SELECT p.pet_id, p.name, p.age, p.breed, p.gender, p.availability_status,
                       p.shelter_id, s.shelter_name
                FROM pets p
                JOIN shelters s ON p.shelter_id = s.shelter_id
                ORDER BY p.pet_id
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                pets.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching pets.", e);
        }

        return pets;
    }

    public List<Pet> search(String keyword) {
        List<Pet> pets = new ArrayList<>();

        String sql = """
                SELECT p.pet_id, p.name, p.age, p.breed, p.gender, p.availability_status,
                       p.shelter_id, s.shelter_name
                FROM pets p
                JOIN shelters s ON p.shelter_id = s.shelter_id
                WHERE LOWER(p.name) LIKE ?
                   OR LOWER(p.breed) LIKE ?
                   OR LOWER(p.gender) LIKE ?
                   OR LOWER(p.availability_status) LIKE ?
                   OR LOWER(s.shelter_name) LIKE ?
                ORDER BY p.pet_id
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchTerm = "%" + keyword.toLowerCase() + "%";

            stmt.setString(1, searchTerm);
            stmt.setString(2, searchTerm);
            stmt.setString(3, searchTerm);
            stmt.setString(4, searchTerm);
            stmt.setString(5, searchTerm);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    pets.add(mapRow(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error searching pets.", e);
        }

        return pets;
    }

    public Pet findById(int petId) {
        String sql = """
                SELECT p.pet_id, p.name, p.age, p.breed, p.gender, p.availability_status,
                       p.shelter_id, s.shelter_name
                FROM pets p
                JOIN shelters s ON p.shelter_id = s.shelter_id
                WHERE p.pet_id = ?
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, petId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching pet by ID.", e);
        }

        return null;
    }

    public void insert(Pet pet) {
        String sql = """
                INSERT INTO pets (name, age, breed, gender, availability_status, shelter_id)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, pet.getName());
            stmt.setInt(2, pet.getAge());
            stmt.setString(3, pet.getBreed());
            stmt.setString(4, pet.getGender());
            stmt.setString(5, pet.getAvailabilityStatus());
            stmt.setInt(6, pet.getShelterId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error inserting pet.", e);
        }
    }

    public void update(Pet pet) {
        String sql = """
                UPDATE pets
                SET name = ?, age = ?, breed = ?, gender = ?, availability_status = ?, shelter_id = ?
                WHERE pet_id = ?
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, pet.getName());
            stmt.setInt(2, pet.getAge());
            stmt.setString(3, pet.getBreed());
            stmt.setString(4, pet.getGender());
            stmt.setString(5, pet.getAvailabilityStatus());
            stmt.setInt(6, pet.getShelterId());
            stmt.setInt(7, pet.getPetId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating pet.", e);
        }
    }

    public void delete(int petId) {
        String sql = "DELETE FROM pets WHERE pet_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, petId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting pet. Make sure no adoption application references this pet.", e);
        }
    }

    public List<Pet> findAvailablePets() {
        List<Pet> pets = new ArrayList<>();

        String sql = """
                SELECT p.pet_id, p.name, p.age, p.breed, p.gender, p.availability_status,
                       p.shelter_id, s.shelter_name
                FROM pets p
                JOIN shelters s ON p.shelter_id = s.shelter_id
                WHERE p.availability_status = 'Available'
                ORDER BY p.pet_id
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                pets.add(mapRow(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching available pets.", e);
        }

        return pets;
    }

    private Pet mapRow(ResultSet rs) throws SQLException {
        Pet pet = new Pet();

        pet.setPetId(rs.getInt("pet_id"));
        pet.setName(rs.getString("name"));
        pet.setAge(rs.getInt("age"));
        pet.setBreed(rs.getString("breed"));
        pet.setGender(rs.getString("gender"));
        pet.setAvailabilityStatus(rs.getString("availability_status"));
        pet.setShelterId(rs.getInt("shelter_id"));
        pet.setShelterName(rs.getString("shelter_name"));

        return pet;
    }
}