<%-- 
    Document   : test
    Created on : 20-Jun-2023, 12:55:45
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" enctype="multipart/form-data" action="addslider">
            File to upload: <input type="file" name="upfile"><br/>
            <br/>
            <input type="submit" value="Press"> to upload the file!
        </form>
    </body>
</html>
