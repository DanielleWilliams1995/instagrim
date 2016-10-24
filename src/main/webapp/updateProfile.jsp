<%-- 
    Document   : profile
    Created on : 09-Oct-2016, 02:54:12
    Author     : Danielle
--%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@page import="uk.ac.dundee.computing.aec.instagrim.servlets.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <link rel="stylesheet" type="text/css" href="newcss.css" />


    </head>

    <body>
        <div class="centerContent1">
            <h1>Update Profile Details</h1>


            <%
                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                String currentUser = lg.getUsername();

                if (lg != null) {
                    String UserName = lg.getUsername();
                    if (lg.getlogedin()) {%>
            <%} else {
                                   }%>

            <%
                     }%>




            <form method="POST" action="UpdateProfile">
                <ul>
                    <input type="hidden" value="<%=lg.getUsername()%>" name="username">

                    <li>First Name <input type="text" name="first_name" value="<%=lg.getfirst_name()%>"></li>
                    <li>Last Name <input type="text" name="last_name" value="<%=lg.getlast_name()%>"></li>
                    <li>Password <input type="password" name="password" value="<%=lg.getlast_name()%>"></li>
                    <li>Email <input type="text" name="email" value="<%=lg.getemail()%>"></li>
                </ul>
                <input type="submit" value="Update" id="button" > 

            </form>



            <div class="navBar1">
                <ul>

                    <li><a href="/Instagrim">Home</a></li>
                    <li><a href="/Instagrim/search">Search</a></li>
                    <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>


                </ul>
            </div>


        </div>
    </body>
</html>