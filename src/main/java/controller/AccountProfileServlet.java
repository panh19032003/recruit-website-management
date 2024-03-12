/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)     // 50 MB
@WebServlet(name="AccountProfileServlet", urlPatterns={"/acc_profile"})
public class AccountProfileServlet extends HttpServlet {
    UsersDAO user_dao = new UsersDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        // get account now
        Users acc = (Users) session.getAttribute("account");
        
        // get new information update
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        
        // perform update in database
        acc.setName(name);
        acc.setPhone(phone);
        user_dao.updateUser(acc);
        
        // perform update session
        session.removeAttribute("account");
        session.setAttribute("account", acc);
        
        request.setAttribute("status", "success");
        request.getRequestDispatcher("f7_editprofile.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Part filePart = (Part) request.getPart("avatar"); // "image" là tên của input file

        InputStream fileContent = filePart.getInputStream();
        String avatar = encodeImageToBase64(fileContent);

        UsersDAO user_dao = new UsersDAO();
        HttpSession session = request.getSession();
        Users acc = (Users) session.getAttribute("account");

        acc.setImage("data:image/png;base64," + avatar);
        user_dao.updateUser(acc);
        
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet NewServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>" + acc.getImage() + "</h1>");
//            out.println("<h1>" + acc.getIdUser() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        
        
        session.removeAttribute("account");
        session.setAttribute("account", acc);
//        request.setAttribute("account", acc);
//        
//        request.getRequestDispatcher("test.jsp").forward(request, response);
        request.getRequestDispatcher("f7_editprofile.jsp").forward(request, response);
    }

    private String encodeImageToBase64(InputStream imageInputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;

        while ((bytesRead = imageInputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        byte[] imageBytes = outputStream.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }

}
