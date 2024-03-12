/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.CategoryDAO;
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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CategoryJobs;
import model.Employers;
import model.HistorySubmit;
import model.Jobs;
import model.LoveJobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StatisticServlet", urlPatterns = {"/statistic"})
public class StatisticServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StatisticServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        HistoryDAO his_dao = new HistoryDAO();

        List<HistorySubmit> hisList = new ArrayList<>();
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("account");
        Employers emTemp = new Employers();
        for (Employers em : emList) {
            if (em.getEmailEmployer().equalsIgnoreCase(user.getEmail())) {
                emTemp = em;
                break;
            }
        }

        int success = 0;
        int fail = 0;
        int process = 0;

        List<Jobs> jobList = job_dao.getAllJobByIdEm(emTemp.getIdEmployer());
        for (Jobs jobs : jobList) {
            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "SUCCESSFULL");
            success += hisList.size();

            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "FAILED");
            fail += hisList.size();

            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "PROCESSING");
            process += hisList.size();
        }

        request.setAttribute("success", success);
        request.setAttribute("fail", fail);
        request.setAttribute("process", process);
        request.getRequestDispatcher("f6_statistic.jsp").forward(request, response);
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
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        HistoryDAO his_dao = new HistoryDAO();

        List<HistorySubmit> hisList = new ArrayList<>();
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("account");
        Employers emTemp = new Employers();
        for (Employers em : emList) {
            if (em.getEmailEmployer().equalsIgnoreCase(user.getEmail())) {
                emTemp = em;
                break;
            }
        }

        int success = 0;
        int fail = 0;
        int process = 0;

        List<Jobs> jobList = job_dao.getAllJobByIdEm(emTemp.getIdEmployer());
        for (Jobs jobs : jobList) {
            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "SUCCESSFULL");
            success += hisList.size();

            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "FAILED");
            fail += hisList.size();

            hisList = his_dao.getAllHistoryByIdJob(jobs.getIdJob(), "PROCESSING");
            process += hisList.size();
        }

        String month = request.getParameter("month");
        String year = request.getParameter("year");
        int count = 0;
        
        int monInput = 0;
        
        month = (month==null)?"":month;
        List<HistorySubmit> histoList = new ArrayList<>();
        if(!month.isEmpty()){
            monInput = Integer.parseInt(month);
        }
        for (Jobs jobs : jobList) {
            histoList = his_dao.getAllHistoryByIdJobDate(jobs.getIdJob(), monInput, Integer.parseInt(year));
            count += histoList.size();
        }
        request.setAttribute("success", success);
        request.setAttribute("fail", fail);
        request.setAttribute("process", process);
        request.setAttribute("count", count);
        request.getRequestDispatcher("f6_statistic.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
