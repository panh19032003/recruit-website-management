/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.HistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.HistorySubmit;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ApplyServlet", urlPatterns = {"/apply"})
public class ApplyServlet extends HttpServlet {

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
            out.println("<title>Servlet ApplyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyServlet at " + request.getContextPath() + "</h1>");
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
        String idJob = request.getParameter("idJob");
        request.setAttribute("idJob", idJob);
        request.getRequestDispatcher("f2_giveinfor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("account");
        
        String idJob = request.getParameter("id_job");
        String nameInfor = request.getParameter("nameInfor");
        String emailInfor = request.getParameter("emailInfor");
        String phoneInfor = request.getParameter("phoneInfor");
        String linkInfor = request.getParameter("linkInfor");
        
        HistoryDAO his_dao = new HistoryDAO();
        HistorySubmit hissub = new HistorySubmit(0, "", u.getIdUser(), nameInfor,  
            emailInfor, phoneInfor, Integer.parseInt(idJob), "", linkInfor, "");
        his_dao.createApply(hissub);
        request.getRequestDispatcher("f2_giveinfor.jsp").forward(request, response);
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
