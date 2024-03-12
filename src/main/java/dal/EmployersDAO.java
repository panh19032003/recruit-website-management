/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employers;

public class EmployersDAO extends DBContext {
    public Employers getEmployersByEmail(String email) {
        String sql = "select * from Employers where EmailEmployer = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            // check can find or not find
            if (rs.next()) {
                Employers em = new Employers(rs.getInt("idEmployer"),
                                            rs.getString("emailEmployer"),
                                            rs.getInt("foundedYear"),
                                            rs.getString("numberOfEmployees"),
                                            rs.getString("describes"),
                                            rs.getString("address"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Employers> getAllEmployers() {
        List<Employers> list = new ArrayList<>();
        String sql = "SELECT * FROM Employers";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Employers em = new Employers(rs.getInt("idEmployer"),
                                            rs.getString("emailEmployer"),
                                            rs.getInt("foundedYear"),
                                            rs.getString("numberOfEmployees"),
                                            rs.getString("describes"),
                                            rs.getString("address"));
                list.add(em);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void createEmployers(Employers em) {
        String sql = "INSERT INTO [dbo].[Employers] VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, em.getEmailEmployer());
            st.setInt(2, em.getFoundedYear());
            st.setString(3, em.getNumberOfEmployees());
            st.setString(4, em.getDescribes());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        EmployersDAO em = new EmployersDAO();
//        Employers em1 = new Employers(0, "dsada", 2003, "1000", "");
//        em.createEmployers(em1);
        System.out.println(em.getEmployersByEmail("fpteducation@fpt.edu.vn").toString());
    }

}
