/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EmployersDAO;
import dal.UsersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import model.Employers;
import model.Users;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/account"})
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String choice = request.getParameter("choice");
        if (choice.equals("signup_user")) 
            addUser(request, response);
        else if (choice.equals("signup_em"))
            addEmployer(request, response);
        else if (choice.equals("change_pass")) 
            changePass(request, response);
        else if (choice.equals("disable")) 
            doDisable(request, response);
        else if (choice.equals("logout"))
            logoutAccount(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        checkAccountLogin(request, response);
    }

    private void checkAccountLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("test.jsp").forward(request, response);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        email = (email == null)?"":email;
        password = (password == null)?"":password;
        remember = (remember == null)?"":remember;
        
        HttpSession session = request.getSession();
       
        UsersDAO user = new UsersDAO();
        Users choice = user.checkUsers(email, password);
        
        // check login
        if (choice == null) {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("acc_login.jsp").forward(request, response);
        } else {
            // Auto save
            Cookie email_coo = new Cookie("email_coo", email);
            Cookie pass_coo = new Cookie("pass_coo", password);
            Cookie rem_coo = new Cookie("rem_coo", remember);
            int timeSet = 0;

            // check remember me
            if (!remember.isEmpty())  timeSet = 60 * 60 * 24 * 7;

            email_coo.setMaxAge(timeSet);
            pass_coo.setMaxAge(timeSet);
            rem_coo.setMaxAge(timeSet);

            response.addCookie(email_coo);
            response.addCookie(pass_coo);
            response.addCookie(rem_coo);

            session.setAttribute("account", choice);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameUser = request.getParameter("username");
        String emailUser = request.getParameter("emailUser");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String passwordAgain = request.getParameter("passwordAgain");

        boolean result = checkUser(request, response);

        if (result) {
            // add new user in db
            UsersDAO user = new UsersDAO();
            String logo = "https://inkythuatso.com/uploads/thumbnails/800/2023/03/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg";
            Users u = new Users(0, nameUser, emailUser, password, phone, 1, "", logo, "");
            user.createUser(u);
            response.sendRedirect("acc_login.jsp");
        }
    }

    private void addEmployer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailEmployer = request.getParameter("emailEmployer");
        String password = request.getParameter("password");
        String passwordAgain = request.getParameter("passwordAgain");

        String nameEm = request.getParameter("nameEm");
        String phoneEm = request.getParameter("phoneEm");
        String foundYear = request.getParameter("foundyear");
        String numEm = request.getParameter("numberOfEm");

        boolean result = checkEmployer(request, response);

        if (result) {
            // add new employer in db
            UsersDAO user = new UsersDAO();
            EmployersDAO em = new EmployersDAO();

            String logo = "https://inkythuatso.com/uploads/thumbnails/800/2023/03/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg";

            Users u = new Users(0, nameEm, emailEmployer, password, phoneEm, 0, "", logo, "");
            Employers employer = new Employers(0, emailEmployer,
                    parseInt(foundYear), "Khoảng " + numEm + " nhân viên", "", "");
            user.createUser(u);
            em.createEmployers(employer);
            response.sendRedirect("acc_login.jsp");
        }
    }

    private void changePass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Users user = (Users) session.getAttribute("account");
        String email = user.getEmail();

        String old_pass = request.getParameter("old_pass");
        String new_pass = request.getParameter("new_pass");
        String new_pass_again = request.getParameter("new_pass_again");

        old_pass = (old_pass == null) ? "" : old_pass;
        new_pass = (new_pass == null) ? "" : new_pass;
        new_pass_again = (new_pass_again == null) ? "" : new_pass_again;

        String oldErr = "";
        String passAgainErr = "";
        // perform check to change password
        if (!old_pass.isEmpty()) {
            // compare between input password and password in db
            if (!old_pass.equals(user.getPassword())) {
                oldErr = "Sai mật khẩu vui lòng nhập lại.";
            }

            // check pass and pass again
            if (!new_pass.equals(new_pass_again)) {
                passAgainErr = "Mật khẩu không trùng khớp.";
            }

            // perform to change
            if (old_pass.equals(user.getPassword()) && new_pass.equals(new_pass_again)) { // perform change
                UsersDAO use_dao = new UsersDAO();
                user.setPassword(new_pass);
                
                use_dao.updateUser(user);

                session.removeAttribute("account");
                request.getRequestDispatcher("acc_login.jsp").forward(request, response);
            }
        }
        request.setAttribute("oldErr", oldErr);
        request.setAttribute("passAgainErr", passAgainErr);
        request.getRequestDispatcher("f7_change_password.jsp").forward(request, response);
    }

    private void doDisable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersDAO user_dao = new UsersDAO();
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        user_dao.disableAccount(email);
        session.removeAttribute("account");
        response.sendRedirect("home.jsp");
    }

    private void logoutAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        response.sendRedirect("home.jsp");
    }

    private boolean checkUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameUser = request.getParameter("username");
        String emailUser = request.getParameter("emailUser");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String passwordAgain = request.getParameter("passwordAgain");

        String nameUserErr = "";
        String emailUserErr = "";
        String phoneErr = "";
        String passwordAgainErr = "";

        // check format nameUser input
//        if (!nameUser.matches("[a-zA-Z ]+")) {
//            nameUserErr = "Tên chỉ được chứa kí tự từ a-z A-Z.";
//            request.setAttribute("nameUserErr", nameUserErr);
//        }

        // check format emailUserErr input
        if (!emailUser.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9.]+$")) {
            emailUserErr = "Sai format email.";
            request.setAttribute("emailUserErr", emailUserErr);
        }

        // check format phone input
        if (!phone.trim().isEmpty() && !phone.matches("^0[35789]{1}\\d{8}$")) {
            phoneErr = "Số điện thoại phải gồm 10 chữ số và số 0 ở đầu.";
            request.setAttribute("phoneErr", phoneErr);
        }

        // check format password input
        if (!passwordAgain.equals(password)) {
            passwordAgainErr = "Mật khẩu xác nhận phải giống mật khẩu trước đó.";
            request.setAttribute("passwordAgainErr", passwordAgainErr);
        }

        // check duplicate email
        if (emailUserErr.isEmpty()) {
            UsersDAO user = new UsersDAO();
            Users choice = user.getUserByEmail(emailUser);
            // email is exist
            if (choice != null) {
                emailUserErr = "Email đã tồn tại. Vui lòng nhập email khác!";
                request.setAttribute("emailUserErr", emailUserErr);
            }
        }

        // move page
        if (!nameUserErr.isEmpty() || !emailUserErr.isEmpty()
                || !phoneErr.isEmpty() || !passwordAgainErr.isEmpty()) {
            request.getRequestDispatcher("acc_signup_user.jsp").forward(request, response);
            return false;
        }
        return true;

    }

    private boolean checkEmployer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailEm = request.getParameter("emailEmployer");
        String passwordEm = request.getParameter("password");
        String passwordAgainEm = request.getParameter("passwordAgain");

        String phoneEm = request.getParameter("phoneEm");
        String foundYear = request.getParameter("foundyear");
        String numEm = request.getParameter("numberOfEm");

        String emailEmErr = "";
        String passwordAgainEmErr = "";
        String phoneEmErr = "";

        // check format emailEm input
        if (!emailEm.matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9.]+$")) {
            emailEmErr = "Sai format email.";
            request.setAttribute("emailEmErr", emailEmErr);
        }

        // check password again input
        if (!passwordEm.equals(passwordAgainEm)) {
            passwordAgainEmErr = "Mật khẩu xác nhận phải giống mật khẩu trước đó.";
            request.setAttribute("passwordAgainEmErr", passwordAgainEmErr);
        }

        // check format phone input
        if (!phoneEm.trim().isEmpty() && !phoneEm.matches("^0[35789]{1}\\d{8}$")) {
            phoneEmErr = "Số điện thoại phải gồm 10 chữ số và số 0 ở đầu.";
            request.setAttribute("phoneEmErr", phoneEmErr);
        }

        // check duplicate email
        if (emailEmErr.isEmpty()) {
            UsersDAO user = new UsersDAO();
            Users choice = user.getUserByEmail(emailEmErr);
            // email is exist
            if (choice != null) {
                emailEmErr = "Email đã tồn tại. Vui lòng nhập email khác!";
                request.setAttribute("emailEmErr", emailEmErr);
            }
        }

        // move page
        if (!emailEmErr.isEmpty() || !passwordAgainEmErr.isEmpty() || !phoneEmErr.isEmpty()) {
            request.getRequestDispatcher("acc_signup_em.jsp").forward(request, response);
            return false;
        }
        return true;

    }

    private int parseInt(String number) {
        int num = 0;
        try {
            num = Integer.parseInt(number);
        } catch (Exception e) {
            System.out.println(e);
        }
        return num;
    }
}
