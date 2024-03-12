/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.EmployersDAO;
import dal.JobsDAO;
import dal.UsersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Employers;
import model.Jobs;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name="JobsServlet", urlPatterns={"/job"})
public class JobsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String choice_job = request.getParameter("choice");
        String url = "";
        
        if(choice_job.equals("find_job")){
            url = "findjob";
        }else if(choice_job.equals("find_job_detail")){
            url = "findjobdetail";
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    

}
