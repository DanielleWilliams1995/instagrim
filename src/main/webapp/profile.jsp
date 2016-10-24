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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h1>Your Profile</h1>


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


            <jsp:useBean id="clock" class="java.util.Date" />
            <c:choose>

                <c:when test="${clock.hours < 12}">
                    <h2>Good morning <%=lg.getUsername()%> </h2>
                </c:when>
                <c:when test="${clock.hours < 18}">
                    <h2>Good afternoon <%=lg.getUsername()%></h2>

                </c:when> 
                <c:otherwise>
                    <h2>Good evening <%=lg.getUsername()%></h2>
                </c:otherwise>
            </c:choose>


            <div>
                <ul>
                    <li><b> Username: </b><%=lg.getUsername()%> </li>            
                    <li><b> First Name:</b> <%=lg.getfirst_name()%> </li>
                    <li> <b>Last Name:</b> <%=lg.getlast_name()%> </li>
                    <li> <b>Email Address:</b> <%=lg.getemail()%> </li>
                    <li> <b>Password:</b> <%=lg.getpassword()%> </li>
                </ul>

            </div>

            <form method="POST" enctype="multipart/form-data" action="Image">
                <input type="file" name="upfile"><br/>
                <input type="submit" value="Update Profile Pic" id="button"> 
                <input type="hidden" name="profilePic" value="true">
            </form>



            <div class="navBar1">
                <ul>

                    <li><a href="/Instagrim">Home</a></li>
                    <li><a href="/Instagrim/search">Search</a></li>
                    <li><a href="/Instagrim/UpdateProfile">Update Profile</a></li>
                    <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>


                </ul>
            </div>
            <form action="/Instagrim/DeleteAccount">
                <input type="submit" id="button" value="Delete Account?" />
            </form>


    </body>
</html>
