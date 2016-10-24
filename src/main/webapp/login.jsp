<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="logIn">
                <h1>Login </h1>
                <br>
                <h2>Please enter your username and password</h2>
                <form method="POST"  action="login">
                    <ul>
                        <br>
                        <li>User Name <input type="text" name="username"></li>
                        <li>Password  <input type="password" name="password"></li>

                    </ul>
                    <br>
                    <input type="submit" value="login" id="button"> 
                </form>
            </div>



            <div class="navBar1">
                <ul>
                    <li><a href="/Instagrim">InstaGrim</a></li>
                    <li><a href="/Instagrim">Home</a></li>
                    <li><a href="/Instagrim/Register">Register</a></li>

                </ul>
            </div>
        </div>

    </body>
</html>
