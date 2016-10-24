<%-- 
    Document   : comment
    Created on : 18-Oct-2016, 18:59:12
    Author     : Danielle
--%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.servlets.Image"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.models.PicModel"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="centerContent1">
        <h1>Comments</h1>
        <%String picID = (String)request.getAttribute("pictureID");%>
        <a href="/Instagrim/Image/<%=picID%>">
            <img id="userPicture" src="/Instagrim/Thumb/<%=picID%>" alt="user picture"></a>
        
       
         
         
         <p>Click <a href="/Instagrim/404.jsp">here</a> see picture comments.</p>
        </div>
    </body>
</html>
