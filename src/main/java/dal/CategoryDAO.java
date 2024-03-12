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
import model.CategoryJobs;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext{
    public List<CategoryJobs> getAllCategory() {
        List<CategoryJobs> list = new ArrayList<>();
        String sql = "SELECT * FROM CategoryJobs";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                CategoryJobs cate = new CategoryJobs(rs.getString("idCategory"),
                                                    rs.getString("nameCategory"));
                list.add(cate);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<CategoryJobs> list = c.getAllCategory();
        System.out.println(list.size());
    }
    
}
