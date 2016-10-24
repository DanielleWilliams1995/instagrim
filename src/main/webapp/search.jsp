<%-- 
    Document   : search
    Created on : 18-Oct-2016, 13:19:04
    Author     : Danielle
--%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import="java.util.*" %>
<%@page import="uk.ac.dundee.computing.aec.instagrim.models.PicModel"%>
<%@page import="java.util.UUID"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.servlets.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <link rel="stylesheet" type="text/css" href="newcss.css" />
    </head>
    <body>
        <div class="centerContent1">
            <div class="logIn">
                <h1> Search </h1>

                <h2> Please enter the username you would like to search for: </h2>

                <br>
                <form method="post" action="search">
                    <input type="text" name="search" placeholder="Search..">
                    <input type="submit" value="Search" >

                </form>

                <div class="navBar1">
                    <ul>
                        <li><a href="/Instagrim">Home</a></li>
                        <li><a href="/Instagrim/profile">Your Profile</a></li>
                        <li><a href="/Instagrim/Logout">Logout</a></li>


                    </ul>
                </div>

            </div>
    </body>

</html>
