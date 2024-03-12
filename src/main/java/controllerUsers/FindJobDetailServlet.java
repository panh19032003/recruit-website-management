/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerUsers;

import dal.EmployersDAO;
import dal.JobsDAO;
import dal.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Employers;
import model.Jobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FindJobDetailServlet", urlPatterns = {"/findjobdetail"})
public class FindJobDetailServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersDAO user_dao = new UsersDAO();
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();

        String id = request.getParameter("idJob");
        int idJob = Integer.parseInt(id);

        List<Users> userList = user_dao.getAllUsers();
        List<Employers> emList = em_dao.getAllEmployers();
        Jobs job = job_dao.getJobsById(idJob);

        request.setAttribute("job", job);
        request.setAttribute("userList", userList);
        request.setAttribute("emList", emList);
        request.getRequestDispatcher("f2_findjob_detail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void loadDetailJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersDAO user_dao = new UsersDAO();
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();

        String id = request.getParameter("idJob");
        int idJob = Integer.parseInt(id);

        List<Users> userList = user_dao.getAllUsers();
        List<Employers> emList = em_dao.getAllEmployers();
        Jobs job = job_dao.getJobsById(idJob);

        request.setAttribute("job", job);
        request.setAttribute("userList", userList);
        request.setAttribute("emList", emList);
        request.getRequestDispatcher("f2_findjob_detail.jsp").forward(request, response);
    }

}
