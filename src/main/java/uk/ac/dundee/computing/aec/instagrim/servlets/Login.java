/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    Cluster cluster = null;

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User us = new User();
        us.setCluster(cluster);
        boolean isValid = us.IsValidUser(username, password);
        HttpSession session = request.getSession();
        System.out.println("Session in servlet " + session);
        if (isValid) {
            LoggedIn lg = new LoggedIn();

            password = us.displayPassword(username);
            String first_name = us.displayfirst_name(username);
            String last_name = us.displaylast_name(username);
            UUID profPic = us.getProfilePicture(username);
            String email = us.displayemail(username);

            lg.setLogedin();
            lg.setUsername(username);
            lg.setpassword(password);
            lg.setfirst_name(first_name);
            lg.setlast_name(last_name);
            lg.setemail(email);
            request.setAttribute("ProfilePic", profPic);

//request.setAttribute("LoggedIn", lg);
            session.setAttribute("LoggedIn", lg);
            System.out.println("Session in servlet " + session);
            response.sendRedirect("/Instagrim/profile");

        } else {
            response.sendRedirect("/Instagrim/login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
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
