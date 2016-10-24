<%-- 
    Document   : ProfilePic
    Created on : 23-Oct-2016, 19:50:53
    Author     : Danielle
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

            <header>
                <h1>Register</h1>
                <h2>STEP 2: Please Select your profile picture</h2>
            </header>


            <%
                 if (request.getAttribute("ProfilePic") == null) { %>
            <img id="ProfPic" src = "figure.jpg" style="width: 150px; height: 150px;">
            <%
                } else {%>
            <img id="ProfPic" src = "/Instagrim/Image/<%= request.getAttribute("ProfilePic")%>" style="width: 120px; height: 120px; display: inline-block; position: absolute; top: 0px; left: 20px;">
            <%
                }
            %>


            <form method="POST" enctype="multipart/form-data" action="Image">
                <input type="file" name="upfile"><br/>
                <input type="submit" value="Complete Registration Process"> 
                <input type="hidden" name="profilePic" value="true">
            </form>



        </div>

        <div class="navBar1">
            <ul>

                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/search.jsp">Search</a></li>




            </ul>
        </div>

    </body>
</html>