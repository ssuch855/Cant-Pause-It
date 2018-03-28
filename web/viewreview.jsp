<%@ page import="models.ReviewModel" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>All Reviews</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="resources/review.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
      integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
      integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>

</head>
<body>
<!-- Let's start by loading information we expect in the request.
     For any info missing, we'll just fake it.
  -->
<%
    UserModel user = (UserModel) request.getAttribute("user");
    if (user == null) {
        user = new UserModel();
        user.setUsername("anonymous");
    }

    ReviewModel review= (ReviewModel) request.getAttribute("review");
    if (review == null) {
        review = new ReviewModel();
        review.setStory("Unavailable");
    }
%>
<p></p>
<p></p>
<!--<div class="container">-->
    <form action="viewReviews" method="post">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="welcome">Can't Pause It</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="viewReviews">Home</a></li>
                    <li><a href="pc">PC</a></li>
                    <li><a href="#">PS3</a></li>
                    <li><a href="#">PS4</a></li>
                    <li><a href="#">Xbox 360</a></li>
                    <li><a href="#">Xbox One</a></li>
                    <li><a href="#">Nintendo Switch</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=user.getUsername()%></a></li>
                </ul>
            </div>
        </nav>

        <!-- Display review-->
        <div class="container">
            <div class="row">
                <div class="well well-sm">
                    <h3><p class="text-primary">Story by:<%=review.getUsername()%></h3>
                    <div class="pre-scrollable">
                        <%=review.getStory()%>
                    </div>
                </div>
            </div>
        </div>


        <!-- This is a screet input to the post!  Acts as if the user
             had an input field with the username.
         -->
        <input type="hidden" name="username" value="<%=user.getUsername()%>">

    </form>
<!--</div>-->
</body>
</html>
