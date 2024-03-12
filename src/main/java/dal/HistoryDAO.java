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
import model.HistorySubmit;

/**
 *
 * @author Admin
 */
public class HistoryDAO extends DBContext {

    public List<HistorySubmit> getAllHistoryByIdJobDate(int id, int mon, int year) {
        List<HistorySubmit> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM HistorySubmit\n"
                + "WHERE YEAR(TimeSubmit) = " + year + "and IdJob = " + id;
        
        if(mon!=0){
            sql += "and MONTH(TimeSubmit) = " + mon;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                HistorySubmit his = new HistorySubmit(rs.getInt("idHistory"),
                        rs.getString("timeSubmit"),
                        rs.getInt("idUser"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("phone"),
                        rs.getInt("idJob"),
                        rs.getString("status"),
                        rs.getString("link"),
                        rs.getString("handle"));
                list.add(his);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<HistorySubmit> getAllHistoryByIdJob(int id, String m) {
        List<HistorySubmit> list = new ArrayList<>();
        String sql = "SELECT * FROM HistorySubmit where idjob = ? and status=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, m);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                HistorySubmit his = new HistorySubmit(rs.getInt("idHistory"),
                        rs.getString("timeSubmit"),
                        rs.getInt("idUser"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("phone"),
                        rs.getInt("idJob"),
                        rs.getString("status"),
                        rs.getString("link"),
                        rs.getString("handle"));
                list.add(his);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<HistorySubmit> getAllHistory() {
        List<HistorySubmit> list = new ArrayList<>();
        String sql = "SELECT * FROM HistorySubmit";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                HistorySubmit his = new HistorySubmit(rs.getInt("idHistory"),
                        rs.getString("timeSubmit"),
                        rs.getInt("idUser"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("phone"),
                        rs.getInt("idJob"),
                        rs.getString("status"),
                        rs.getString("link"),
                        rs.getString("handle"));
                list.add(his);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // ===================== CRUD ===========================
    public void createApply(HistorySubmit history) {
        String sql = "INSERT INTO [dbo].[HistorySubmit] VALUES (CONVERT(VARCHAR(10), GETDATE(), 120), ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, history.getIdUser());
            st.setString(2, history.getName());
            st.setString(3, history.getEmail());
            st.setString(4, history.getPhone());
            st.setInt(5, history.getIdJob());
            st.setString(6, "PROCESSING");
            st.setString(7, history.getLink());
            st.setString(8, "stop");

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE [dbo].[HistorySubmit]\n"
                + "   SET [Status] = ?"
                + "      ,[Handle] = 'go'\n"
                + " WHERE IdHistory = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);

            int rs = st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public HistorySubmit getById(int id) {
        String sql = "SELECT * FROM HistorySubmit Where idHistory = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            if (rs.next()) {
                HistorySubmit his = new HistorySubmit(rs.getInt("idHistory"),
                        rs.getString("timeSubmit"),
                        rs.getInt("idUser"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("phone"),
                        rs.getInt("idJob"),
                        rs.getString("status"),
                        rs.getString("link"),
                        rs.getString("handle"));
                return his;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        HistoryDAO his = new HistoryDAO();
        List<HistorySubmit> list = his.getAllHistoryByIdJobDate(1, 10, 2023);
        System.out.println(list.size());
//        
//        HistorySubmit hs = new HistorySubmit(0, "", 2, "dasdasd","faw@", "0987654321", 1, "", "");
//        his.createApply(hs);

//        his.updateStatus(1, "SUCCESSFULL");
    }
}
