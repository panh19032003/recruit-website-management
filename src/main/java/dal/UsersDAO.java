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
import model.Users;

public class UsersDAO extends DBContext {
    public Users getUserByEmail(String email) {
        String sql = "select * from Users where email = ? and status = 'on'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            // check can find or not find
            if (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Users> getEmployersByName(String name) {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users where name like ? and status = 'on'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM Users where status = 'on'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                list.add(u);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Users> getAllUsersEm() {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE status = 'on';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                if(u.getRole() == 0)
                    list.add(u);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Users checkUsers(String email, String password) {
        String sql = "SELECT * FROM Users WHERE Email = ? and status = 'on'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            // check can find or not find
            if (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                // check password
//                if(u.getPassword().equals(password))
                    return u;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

// =========================== CRUD ===================================
    public void createUser(Users user) {
        String sql = "INSERT INTO [dbo].[Users] VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getPhone());
            st.setInt(5, user.getRole());
            st.setString(6, user.getImage());
            st.setString(7, user.getLogo());
            st.setString(8, "on");

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateUser(Users account){
        String sql = """
            UPDATE Users
            SET [Name] = ?,
                [Email] = ?,
                [Password] = ?,
                [Phone] = ?,
                [Role] = ?,
                [Image] = ?,
                [Logo] = ?,
                [Status] = ?
            WHERE IdUser = ?
        """;
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getName());
            st.setString(2, account.getEmail());
            st.setString(3, account.getPassword());
            st.setString(4, account.getPhone());
            st.setInt(5, account.getRole());
            st.setString(6, account.getImage());
            st.setString(7, account.getLogo());
            st.setString(8, account.getStatus());
            st.setInt(9, account.getIdUser());

            int rs = st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void disableAccount(String email){
        String sql = "UPDATE [dbo].[Users]\n" +
                    "   SET [status] = 'off'\n" +
                    " WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            
            int rs = st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public Users getById(int id) {
        String sql = "SELECT * FROM Users Where idUser = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            if (rs.next()) {
                Users u = new Users(rs.getInt("idUser"), 
                                    rs.getString("name"),
                                    rs.getString("email"), 
                                    rs.getString("password"), 
                                    rs.getString("phone"), 
                                    rs.getInt("role"), 
                                    rs.getString("image"),
                                    rs.getString("logo"),
                                    rs.getString("status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        UsersDAO user = new UsersDAO();
        System.out.println(user.getById(1).getEmail());
    }
    
}










