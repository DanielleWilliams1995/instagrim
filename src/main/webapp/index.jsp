<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@page import="uk.ac.dundee.computing.aec.instagrim.models.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="centerContent2">
            <header>
                <h1>InstaGrim</h1>
                <h2>Your world in Black and White</h2><br>
            </header>
            <nav>
                <ul>
                    <%

                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>


                    <%}
                    } else {
                    %>


                    <%
                        }%>
                </ul>
            </nav>
        </div>

        <div class="bottomleft">&COPY; Andy C & Danielle W</div>

        <footer>
            <div class="navBar">
                <ul>
                    <li class="footer"><a href="/Instagrim">Home</a></li>
                    <li><a href="/Instagrim/login">Login</a></li>
                    <li><a href="/Instagrim/Register">Register</a></li>


                </ul>
            </div>
        </footer>

    </body>
</html>


