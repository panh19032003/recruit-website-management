/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.EmployersDAO;
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
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name="EmployersServlet", urlPatterns={"/employer"})
public class EmployersServlet extends HttpServlet {
   
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
            out.println("<title>Servlet InformationServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InformationServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getAllUsersEm();
        
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("f4_list_company.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        name = (name==null)?"":name;
        
        EmployersDAO em_dao = new EmployersDAO();
        UsersDAO user_dao = new UsersDAO();
        
        List<Employers> emList = em_dao.getAllEmployers();
        List<Users> userList = user_dao.getEmployersByName(name);
        
        request.setAttribute("emList", emList);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("f4_list_company.jsp").forward(request, response);

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
