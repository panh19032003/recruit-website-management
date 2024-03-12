/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.HistoryDAO;
import dal.UsersDAO;
import information.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.HistorySubmit;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HandleDetailServlet", urlPatterns = {"/handledetail"})
public class HandleDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HandleDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idJob");
        int idJob = Integer.parseInt(id);

        UsersDAO user_dao = new UsersDAO();
        HistoryDAO his_dao = new HistoryDAO();

        List<Users> userList = user_dao.getAllUsers();
        List<HistorySubmit> hisList = his_dao.getAllHistory();

        request.setAttribute("userList", userList);
        request.setAttribute("hisList", hisList);
        request.setAttribute("idJob", idJob);
        request.getRequestDispatcher("f6_handle_detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HistoryDAO his_dao = new HistoryDAO();
        UsersDAO user_dao = new UsersDAO();

        String idJob = request.getParameter("idJob");
        String idHis = request.getParameter("idHis");
        String accept = request.getParameter("accept");
        String reject = request.getParameter("reject");

        accept = (accept == null) ? "" : accept;
        reject = (reject == null) ? "" : reject;

        HistorySubmit history = his_dao.getById(Integer.parseInt(idHis));
        
        if (!accept.isEmpty()) {
            his_dao.updateStatus(Integer.parseInt(idHis), "SUCCESSFULL");
            Mail.sendEmail(history.getEmail(), "CV đã được thông qua", Mail.sendMailSuccess());
        } else {
            his_dao.updateStatus(Integer.parseInt(idHis), "FAILED");
            Mail.sendEmail(history.getEmail(), "CV đã không được thông qua", Mail.sendMailFail());
        }

        List<Users> userList = user_dao.getAllUsers();
        List<HistorySubmit> hisList = his_dao.getAllHistory();

        request.setAttribute("userList", userList);
        request.setAttribute("hisList", hisList);
        request.setAttribute("idJob", Integer.parseInt(idJob));
        request.getRequestDispatcher("f6_handle_detail.jsp").forward(request, response);
    }


}
