<%--
  Created by IntelliJ IDEA.
  User: saurabh
  Date: 10/8/15
  Time: 10:37 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
    <style type="text/css">
    .usertable{
        width:100%;
        border-collapse:collapse;
    }

    .usertable th{
        text-align: center;
    }
    .usertable td{
        padding:7px; border:#4e95f4 1px solid; text-align: center;
    }
    /* provide some minimal visual accomodation for IE8 and below */
    .usertable tr{
        background: #b8d1f3;
    }
    /*  Define the background color for all the ODD background rows  */
    .usertable tr:nth-child(odd){
        background: #b8d1f3;
    }
    /*  Define the background color for all the EVEN background rows  */
    .usertable tr:nth-child(even){
        background: #dae5f4;
    }
    </style>
    <meta name="layout" content="main" />
</head>

<body>
<table class="usertable" border="1">
    <thead>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Active</th>
        <th>Manage</th>
    </thead>
    <g:each in="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.active}</td>
            <td>
            <g:if test="${user.active == 'Yes'}">
                Deactivate
            </g:if>
            <g:else>
                Activate
            </g:else>
            </td>
        </tr>
    </g:each>
</table>
</body>
</html>