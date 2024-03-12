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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale.Category;
import model.CategoryJobs;
import model.Employers;
import model.Jobs;
import model.LoveJobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FindJobServlet", urlPatterns = {"/findjob"})
public class FindJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("option");
        option = (option==null)?"":option;
        
        if(option.equals("savejob")){
            loveJob(request, response);
        }
        loadJob(request, response);
            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void loadJob(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        JobsDAO job_dao = new JobsDAO();
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        LoveJobsDAO love_dao = new LoveJobsDAO();
        CategoryDAO cate_dao = new CategoryDAO();
        
        List<Jobs> jobList = job_dao.getAllJobsDemo();
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();
        List<LoveJobs> loveList = love_dao.getAllLoveJobs();
        List<CategoryJobs> cateList = cate_dao.getAllCategory();

        request.setAttribute("cateList", cateList);
        request.setAttribute("jobList", jobList);
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.setAttribute("loveList", loveList);
        request.getRequestDispatcher("f2_findjob.jsp").forward(request, response);
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
