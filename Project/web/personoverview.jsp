<%@ page import="domain.model.Person" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="UTF-8">
    <title>Overview</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="container">
    <header>
        <h1><span>Web shop</span></h1>
        <nav>
            <ul>
                <li><a href="Controller">Home</a></li>
                <li id="actual"><a href="Controller?command=overview">Overview</a></li>
                <li><a href="Controller?command=signUp">Sign up</a></li>
            </ul>
        </nav>
        <h2>
            User Overview
        </h2>

    </header>
    <main>
        <%
            if (request.getAttribute("persons") == null) {
        %>
        <p>No products to show</p>
        <%
        } else { %>
        <table>
            <tr>
                <th>E-mail</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <% for (Person person : (ArrayList<Person>) (request.getAttribute("persons"))) { %>
            <tr>
                <td><%= person.getEmail()%>
                </td>
                <td><%= person.getFirstName()%>
                </td>
                <td><%= person.getLastName()%>
                </td>
            </tr>
            <% } %>
            <caption>Product Overview</caption>
        </table>
        <% } %>
    </main>
    <footer>
        &copy; Webontwikkeling 3, UC Leuven-Limburg
    </footer>
</div>
</body>
</html>