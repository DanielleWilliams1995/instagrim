<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <link rel="stylesheet" type="text/css" href="newcss.css" />

    </head>
    <body>
        <div class="centerContent1">
            <div class="Register">
                <header>
                    <h1>Register</h1>
                    <h2>STEP 1: Enter your details below:</h2>
                </header>
                <form method="POST"  action="Register">
                    <ul>

                        <li>User Name: <input type="text" name="username"></li>
                        <li>First Name: <input type="text" name="first_name"></li>
                        <li>Last Name: <input type="text" name="last_name"></li>
                        <li>Password: <input type="password" name="password"></li>
                        <li>Email: <input type="text" name="email"></li>

                    </ul>
                    <br/>
                    <input type="submit" value="Register" id="button"> 
                </form>
            </div>

            <footer>
                <div class="navBar1">
                    <ul>
                        <li><a href="/Instagrim">Home</a></li>
                        <li><a href="/Instagrim/login">Login</a></li>
                        <li><a href="/Instagrim/search">Search</a></li>

                    </ul>
                </div>
            </footer>
        </div>
    </body>
</html>
