/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllerAdmin;

import dal.CategoryDAO;
import dal.EmployersDAO;
import dal.JobsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.CategoryJobs;
import model.Employers;
import model.Jobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name="CreateJobServlet", urlPatterns={"/createjob"})
public class CreateJobServlet extends HttpServlet {
   
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
            out.println("<title>Servlet CreateJobServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateJobServlet at " + request.getContextPath () + "</h1>");
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
        CategoryDAO cate_dao = new CategoryDAO();
        List<CategoryJobs> cateList = cate_dao.getAllCategory();
        request.setAttribute("cateList", cateList);
        request.getRequestDispatcher("f6_postjob.jsp").forward(request, response);
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
        JobsDAO job_dao = new JobsDAO();
        HttpSession session = request.getSession();
        Users u  = (Users)session.getAttribute("account");
        String email = u.getEmail();
        
        EmployersDAO em_dao = new EmployersDAO();
        Employers em = em_dao.getEmployersByEmail(email);
        
        int idEm = em.getIdEmployer();
        String idCate = request.getParameter("jobcategory");
        String namejob = request.getParameter("namejob");
        String salary = "";
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String addressjob = request.getParameter("addressjob");
        String deadlinejob = request.getParameter("deadlinejob");
        String describejob = request.getParameter("describejob");
        String requirejob = request.getParameter("requirejob");
        String benefitjob = request.getParameter("benefitjob");
        String experiencejob = request.getParameter("experiencejob");
    
        namejob = (namejob == null)?"":namejob;
        from = (from == null)?"":from;
        to = (to == null)?"":to;
        addressjob = (addressjob == null)?"":addressjob;
        deadlinejob = (deadlinejob == null)?"":deadlinejob;
        describejob = (describejob == null)?"":describejob;
        requirejob = (requirejob == null)?"":requirejob;
        benefitjob = (benefitjob == null)?"":benefitjob;
        experiencejob = (experiencejob == null)?"":experiencejob;
        
        if(!from.isEmpty() && !to.isEmpty()){
            salary = from + " - " + to +  " triệu";
        }else if(!from.isEmpty()){
            salary = "Trên " + from;
        }else if(!to.isEmpty()){
            salary = "Dưới " + to;
        }else{
            salary = "Thỏa thuận";
        }
        
        Jobs j = new Jobs(0, namejob, salary, "NEW", addressjob, deadlinejob, 
            describejob, requirejob, benefitjob, idCate, idEm, experiencejob, 3);
        job_dao.createJob(j);
        
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet CreateJobServlet</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<a href='createjob'>Successfull, click here to continue</a>");
        out.println("</body>");
        out.println("</html>");
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
