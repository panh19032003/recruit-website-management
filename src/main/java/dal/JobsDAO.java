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
import model.Jobs;

public class JobsDAO extends DBContext {

    public List<Jobs> getAllJobByIdEm(int id) {
        List<Jobs> list = new ArrayList<>();
        String sql = "select * from Jobs\n"
                + "where IdEmployer = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));
                list.add(job);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Jobs getJobsById(int id) {
        String sql = "select * from Jobs where IdJob = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            // check can find or not find
            if (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));
                // get city of address
                String[] arr = job.getAddress().split(",");
                String newAddress = arr[arr.length - 1];
                job.setAddress(newAddress);

                //convert date
                String[] a = job.getDeadline().split("-");
                String newDead = a[2] + "/" + a[1] + "/" + a[0];
                job.setDeadline(newDead);
                return job;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Jobs> getAllJobs() {
        List<Jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));
                list.add(job);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Jobs> getAllJobsDemo() {
        List<Jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));

                // get city of address
                String[] arr = job.getAddress().split(",");
                String newAddress = arr[arr.length - 1];
                job.setAddress(newAddress);
                list.add(job);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Jobs> filterJob(String idCategory, String salary, String address, String experience) {
        List<Jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM Jobs;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));
                list.add(job);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

// =========================== CRUD ===================================
    public void createJob(Jobs job) {
        String sql = "INSERT INTO [dbo].[Jobs] VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, job.getNameJob());
            st.setString(2, job.getSalary());
            st.setString(3, job.getStatus());
            st.setString(4, job.getAddress());
            st.setString(5, job.getDeadline());
            st.setString(6, job.getDescribes());
            st.setString(7, job.getRequirements());
            st.setString(8, job.getBenefits());
            st.setString(9, job.getIdCategory());
            st.setInt(10, job.getIdEmployer());
            st.setString(11, job.getExperience());
            st.setInt(12, job.getTypeSalary());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Jobs> searchJobs(String idCategory, String nameJob,
            int typeSalary, String address) {
        List<Jobs> list = new ArrayList<>();
        String sql = "select * from Jobs\n"
                + " where IdCategory like '%" + idCategory + "%' "
                + "     and NameJob like N'%" + nameJob + "%'\n"
                + "     and Address like N'%" + address + "%' ";

        if (typeSalary != 0) {
            sql += "and TypeSalary = " + typeSalary;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // loop until select the last object
            while (rs.next()) {
                Jobs job = new Jobs(rs.getInt("idJob"),
                        rs.getString("nameJob"),
                        rs.getString("salary"),
                        rs.getString("status"),
                        rs.getString("address"),
                        rs.getString("deadline"),
                        rs.getString("describes"),
                        rs.getString("requirements"),
                        rs.getString("benefits"),
                        rs.getString("idCategory"),
                        rs.getInt("idEmployer"),
                        rs.getString("experience"),
                        rs.getInt("typeSalary"));

                // get city of address
                String[] arr = job.getAddress().split(",");
                String newAddress = arr[arr.length - 1];
                job.setAddress(newAddress);
                list.add(job);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void delete(String idTask) {
        String sql = "DELETE FROM TASK WHERE ID_TASK = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, idTask);

            int rs = st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
//    
//    public void update(Users task){
//        String sql = "UPDATE [dbo].[TASK]\n" +
//                    "   SET [DETAIL] = ?\n" +
//                    "      ,[ID_TYPE] = ?\n" +
//                    "      ,[DATE] = ?\n" +
//                    " WHERE ID_TASK = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
////            st.setString(1, task.getDetail());
////            st.setString(2, task.getId_type());
////            st.setString(3, task.getDate());
////            st.setString(4, task.getId_task());
//            
//            int rs = st.executeUpdate();
//            
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//    }

    public static void main(String[] args) {
        JobsDAO user = new JobsDAO();
        List<Jobs> lit = user.getAllJobByIdEm(2);
        System.out.println(lit.size());


    }

}
