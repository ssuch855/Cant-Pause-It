<%--
  Created by IntelliJ IDEA.
  User: stevesuchcicki
  Date: 2/27/18
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="models.ReviewModel" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PS4 Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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


%>

<form action="pc" method="post">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="welcome">Can't Pause It</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="viewReviews">Home</a></li>
                <li class="active"><a href="pc">PC</a></li>
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
    <div class="container">
        <div class="row">
            <div class="well well-sm">
                <h3><p class="text-primary"><%=stories.length%> Reviews</h3>
                <div class="pre-scrollable">
                    <ul class="list-group">
                        <%
                            for (int i = stories.length - 1; i >= 0; i--) {
                        %>
                        <li class="list-group-item">[<%=stories[i].getUsername()%>] - (<%=stories[i].getGame()%>-- <%=stories[i].getPlatform() %>)<%=stories[i].getStory()%>
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
    <div class="container">
        <div class="row">
            <div class="well well-sm">
                <div class="form-group">
                    <label for="storyText">Got A Review?</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="game" name="game"
                               placeholder="What is the Game?">
                        <input type="hidden" class="form-control" id="platform" name="platform" value="PC">
                        <input type="text" class="form-control" id="storyText" name="storyText"
                               placeholder="What did you think of this game?">
                    </div>

                    <!-- Button -->

                    <input type="submit" class="btn btn-info" name="submitButton2" value="Submit">
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="username" value="<%=user.getUsername()%>">
</form>
</body>
</html>