<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.servlets.Image"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.models.PicModel"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <link rel="stylesheet" type="text/css" href="/Instagrim/newcss.css" />
    </head>
    <body>
        <div class="centerContent1">
            <header>

                <h1>Your Images</h1>

            </header>

            <div class="navBar1">
                <ul>
                    <li ><a href="/Instagrim/upload">Upload</a></li>
                    <li ><a href="/Instagrim/Images/majed">Sample Images</a></li>
                    <li><a href="/Instagrim/Logout">Log out</a></li>
                </ul>

            </div>
            <article>

                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    if (lsPics == null) {
                %>
                <p>No Pictures found</p>
                <%
                } else {
                    Iterator<Pic> iterator;
                    iterator = lsPics.iterator();
                    while (iterator.hasNext()) {
                        Pic p = (Pic) iterator.next();
                        String userPictureID = p.getSUUID();

                %>


                <a href="/Instagrim/comments/?picID=<%=userPictureID%>"> >
                    <img id="userPicture" src="/Instagrim/Image/<%=p.getSUUID()%>"></a><br/>

                <%
                        }
                    }
                %>

                <%
                    if (request.getAttribute("ProfilePic") == null) { %>
                <img id="ProfPic" src = "question.jpg" style="width: 90px; height: 90px; display: inline-block; position: absolute; top: 0px; left: 20px;">
                <%
                } else {%>
                <img id="ProfPic" src = "/Instagrim/Image/<%= request.getAttribute("ProfilePic")%>" style="width: 120px; height: 120px; display: inline-block; position: absolute; top: 0px; left: 20px;">
                <%
                    }
                %>





            </article>
        </div>
    </body>
</html>
