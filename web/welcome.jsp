<%--@ page import="com.endicott.edu.ui.UiMessage" %>
<%@ page import="com.endicott.edu.xxxxmodels.CollegeModel" --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Can't Pause It</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link rel="stylesheet" href="resources/style.css">

</head>
<body>
<div class="container">

  <form action="welcome" method="post">
    <div class="jumbotron text-center">
      <h1>Can't Pause It</h1>
      <p>Let the world know how good (or bad) that one game is!</p>
    </div>
    <div class="form-group">
      <input type="text" name="username" class="form-control" id="username" placeholder="Enter Your User ID">
      <input type="text" name="password" class="form-control" id="password" placeholder="Enter a Password">
      <input type="text" name="name" class="form-control" id="name" placeholder="Enter Your First Name (If Creating Account)">
    </div>
    <div class="container">
      <input type="submit" class="btn btn-info" name="button" id="login" value="Log In">
      <input type="submit" class="btn btn-info" name="button" id="create" value="Create Account">
    </div>

</form>
</div>
</body>
</html>
