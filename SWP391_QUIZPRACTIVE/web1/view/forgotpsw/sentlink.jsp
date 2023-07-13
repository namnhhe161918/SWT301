<%-- 
    Document   : sentlink
    Created on : 01-Jun-2023, 17:29:47
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/forgotpsw/assets/sentstyle.css"/>
    </head>
    <body>
        <div class="abcdy">
            <div class="abcd">
                <div class="forgot-psw">
                    <div class="forgot-header">
                       

                        <% 
                            String mailsent = (String) request.getAttribute("changepass");
                            if(mailsent != null){
                        %>
                        <%
                        int index = mailsent.indexOf("@");
                        CharSequence subSequence = mailsent.subSequence(0, index);
                        String afterstr =  subSequence.toString();
                        CharSequence subSequence1 = mailsent.subSequence(index, mailsent.length());
                        String afterstr2 =  subSequence1.toString();      
                        mailsent =  afterstr.replace(afterstr.substring(3, subSequence.length()),  "***") + afterstr2.replace(afterstr2.substring(1,6), "***");
                        %>
                         <h3 class="title-forgot">Check your email!</h3>
                        <p class="paragraph">We've sent an email to <%=mailsent%></p>
                        <p class="paragraph">Please check your spam folder if you don't see the email in your inbox.</p>
                        <%} else{%>
                        <div class="title-forgot"> <h3>404 NOT FOUND !</h3></div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
