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
import model.LoveJobs;

/**
 *
 * @author Admin
 */
public class LoveJobsDAO extends DBContext{
    public List<LoveJobs> getAllLoveJobs() {
        List<LoveJobs> list = new ArrayList<>();
        String sql = "SELECT * FROM LoveJobs";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                LoveJobs em = new LoveJobs(rs.getInt("idLove"),
                                            rs.getInt("idUser"),
                                            rs.getInt("idJob"),
                                            rs.getString("status"));
                list.add(em);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // ===================== CRUD ===========================
    public void createLove(LoveJobs love) {
        String sql = "INSERT INTO [dbo].[LoveJobs] VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, love.getIdUser());
            st.setInt(2, love.getIdJob());
            st.setString(3, "on");

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateStatus(LoveJobs love){
        String sql = "UPDATE [dbo].[LoveJobs]\n" +
                    "   SET [Status] = 'off'\n" +
                    " WHERE IdUser = ? and IdJob = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, love.getIdUser());
            st.setInt(2, love.getIdJob());
            int rs = st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        LoveJobsDAO love_dao = new LoveJobsDAO();
//        List<LoveJobs> love = love_dao.getAllLoveJobs();
//        for (LoveJobs loveJobs : love) {
//            System.out.println(loveJobs.toString());
//        }
        love_dao.updateStatus(new LoveJobs(0, 1, 1, ""));
    }
}
