/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerUsers;

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
import model.Employers;
import model.Jobs;
import model.LoveJobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name="DeleteLoveJobServlet", urlPatterns={"/deletelovejob"})
public class DeleteLoveJobServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteLoveJobServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteLoveJobServlet at " + request.getContextPath () + "</h1>");
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
        loveJob(request, response);
        loadJob(request, response);
    } 

private void loadJob(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        LoveJobsDAO love_dao = new LoveJobsDAO();
        
        List<Jobs> jobList = job_dao.getAllJobsDemo();
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();
        List<LoveJobs> loveList = love_dao.getAllLoveJobs();

        request.setAttribute("jobList", jobList);
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.setAttribute("loveList", loveList);
        request.getRequestDispatcher("f2_jobsave.jsp").forward(request, response);
    }
    
    private void loveJob(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        LoveJobsDAO love_dao = new LoveJobsDAO();
        
        String idJob = request.getParameter("idJob");
        String idUser = request.getParameter("idUser");
        String page = request.getParameter("page");
        String status = request.getParameter("status");
        
        LoveJobs love = new LoveJobs(0, Integer.parseInt(idUser), Integer.parseInt(idJob), status);
        if(status.equals("heart")){
            love_dao.createLove(love);
        }else{
            love_dao.updateStatus(love);
        }
        
    }
    
    
    
    

}
