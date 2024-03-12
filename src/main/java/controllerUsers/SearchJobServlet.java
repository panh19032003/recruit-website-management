/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerUsers;

import dal.CategoryDAO;
import dal.EmployersDAO;
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
import model.CategoryJobs;
import model.Employers;
import model.Jobs;
import model.LoveJobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchJobServlet", urlPatterns = {"/searchjob"})
public class SearchJobServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchJobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchJobServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        LoveJobsDAO love_dao = new LoveJobsDAO();
        CategoryDAO cate_dao = new CategoryDAO();

        String idCate = request.getParameter("cate_search");
        String nameJob = request.getParameter("name_search");
        String salaJob = request.getParameter("salary_search");
        String addSearch = request.getParameter("address_search");

        idCate = (idCate == null) ? "" : idCate;
        nameJob = (nameJob == null) ? "" : nameJob;
        salaJob = (salaJob == null) ? "" : salaJob;
        addSearch = (addSearch == null) ? "" : addSearch;

        List<Jobs> jobList = job_dao.searchJobs(idCate, nameJob, Integer.parseInt(salaJob), addSearch);
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();
        List<LoveJobs> loveList = love_dao.getAllLoveJobs();
        List<CategoryJobs> cateList = cate_dao.getAllCategory();

        request.setAttribute("cateList", cateList);
        request.setAttribute("jobList", jobList);
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.setAttribute("loveList", loveList);

//        request.setAttribute("idCate", idCate);
//        request.setAttribute("nameJob", nameJob);
//        request.setAttribute("salaJob", salaJob);
//        request.setAttribute("addSearch", addSearch);
//        request.getRequestDispatcher("test.jsp").forward(request, response);
        request.getRequestDispatcher("f2_findjob.jsp").forward(request, response);
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
        processRequest(request, response);
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
