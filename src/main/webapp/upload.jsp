<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Image"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.*"%>

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
            <h1>File Upload</h1>
            <h2> Lets upload to your photo stream.. </h2>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Upload Image" id="button"> 
            </form>

            <div class="navBar1">
                <ul>
                    <li class="nav"><a href="upload.jsp">Upload</a></li>

                    <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
                    <li><a href="/Instagrim/Logout">Log out</a></li>
                    <li><a href="/Instagrim/profile">Profile</a></li>

                </ul>
            </div>



        </div>
    </body>
</html>
