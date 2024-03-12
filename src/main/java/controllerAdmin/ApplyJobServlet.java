/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerAdmin;

import dal.EmployersDAO;
import dal.HistoryDAO;
import dal.JobsDAO;
import dal.LoveJobsDAO;
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
import model.HistorySubmit;
import model.Jobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name="ApplyJobServlet", urlPatterns={"/applyjob"})
public class ApplyJobServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApplyJobServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyJobServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        HistoryDAO his_dao = new HistoryDAO();
        
        List<Jobs> jobList = job_dao.getAllJobsDemo();
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();
        List<HistorySubmit> hisList = his_dao.getAllHistory();

        request.setAttribute("jobList", jobList);
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.setAttribute("hisList", hisList);
        request.getRequestDispatcher("f2_applyjob.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
