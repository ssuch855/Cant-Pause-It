<%--@ page import="com.endicott.edu.ui.UiMessage" %>
<%@ page import="com.endicott.edu.xxxxmodels.CollegeModel" --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Can't Pause It</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<!--Stylesheet from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_templates_dark_portfolio&stacked=h-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
  .jumbotron{color: black}
  .w3-row-padding img {margin-bottom: 12px}
  /* Set the width of the sidebar to 120px */
  .w3-sidebar {width: 120px;background: #222;}
  /* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
  #main {margin-left: 120px}
  /* Remove margins from "page content" on small screens */
  @media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black"/>

<link rel="stylesheet" href="resources/style.css">

</head>
<body>
<%
  String errorMessage = (String) request.getAttribute("errorMessage");
%>
<div class="container">

  <form action="welcome" method="post">
    <div class="jumbotron text-center">
      <h1>Can't Pause It</h1>
        <p>Let the world know how good (or bad) that one game is!</p>
        <div class="form-group">
        <input type="text" name="username" class="form-control" id="username" placeholder="Enter Your User ID">
        <input type="password" name="password" class="form-control" id="password" placeholder="Enter a Password">
        <input type="text" name="name" class="form-control" id="name" placeholder="Enter Your First Name (If Creating Account)">
      </div>
      <div class="container">
        <input type="submit" class="btn btn-info" name="button" id="login" value="Log In">
        <input type="submit" class="btn btn-info" name="button" id="create" value="Create Account">
      </div>
        <% if(errorMessage != null) { %>
        <div class="alert alert-danger">
            <strong>Info</strong> <%=errorMessage%>
        </div>
        <% } %>
    </div>
</form>
</div>
</body>
</html>
