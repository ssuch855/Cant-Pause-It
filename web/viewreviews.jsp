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

    ReviewModel stories[] = (ReviewModel[]) request.getAttribute("stories");
    if (stories == null) {
        stories = new ReviewModel[0];
    }

    int allReviews = 0;
    for (int i = stories.length - 1; i >= 0; i--) {
        if (stories[i].getCommentOnStoryID() == 0) {
            allReviews = allReviews + 1;
        }
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
                    <a class="navbar-brand" href="viewReviews">Can't Pause It</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="viewReviews">Home</a></li>
                    <li><a href="pc">PC</a></li>
                    <li><a href="ps3">PS3</a></li>
                    <li><a href="ps4">PS4</a></li>
                    <li><a href="xbox360">Xbox 360</a></li>
                    <li><a href="xboxone">Xbox One</a></li>
                    <li><a href="nintendoswitch">Nintendo Switch</a></li>
                    <li><a href="miscellaneous">Miscellaneous</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="welcome">Log Out</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=user.getUsername()%></a></li>
                </ul>
            </div>
        </nav>

        <!-- Display a list of stories -->
        <div class="container">
            <div class="row">
                <div class="well well-sm">
                    <h3><p class="text-primary"><%=allReviews%> Review(s)</h3>
                    <div class="pre-scrollable">
                        <ul class="list-group">
                            <%
                                for (int i = stories.length - 1; i >= 0; i--) {
                                    if (stories[i].getCommentOnStoryID() != 0) {
                                        continue;
                                    }
                            %>
                            <li class="list-group-item"><%=stories[i].getUsername()%><br />(<%=stories[i].getGame()%>-- <%=stories[i].getPlatform() %>)<br /><%=stories[i].getStory()%><br />
                                <input type="submit" class="btn btn-info" name="<%=stories[i].getStoryId()%>" value="View">
                                <%
                                    if(user.getUsername().equals(stories[i].getUsername())){
                                %>
                                <input type="submit" class="btn btn-info" name="<%=stories[i].getStoryId()%>" value="Delete">
                                <%
                                    }
                                %>
                            </li>
                            <%
                                }
                            %>
                        </ul>
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
