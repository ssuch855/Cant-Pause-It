<%--
  Created by IntelliJ IDEA.
  User: stevesuchcicki
  Date: 2/27/18
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="models.ReviewModel" %>
<%@ page import="models.UserModel" %>
<%@ page import="datalayer.LikeDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nintendo Switch Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <!--Stylesheet from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_templates_dark_portfolio&stacked=h-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
        .list-group{color: black}
        .form-group{color: black}
        .w3-row-padding img {margin-bottom: 12px}
        /* Set the width of the sidebar to 120px */
        .w3-sidebar {width: 120px;background: #222;}
        /* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
        #main {margin-left: 120px}
        /* Remove margins from "page content" on small screens */
        @media only screen and (max-width: 600px) {#main {margin-left: 0}}
    </style>
<body class="w3-black"/>

</head>
<body>
<%
    UserModel user = (UserModel) request.getSession().getAttribute("user");
    if (user == null) {
        user = new UserModel();
        user.setUsername("anonymous");
    }

    ReviewModel stories[] = (ReviewModel[]) request.getAttribute("stories");
    if (stories == null) {
        stories = new ReviewModel[0];
    }

    int nintendoReviews = 0;
    for (int i = stories.length - 1; i >= 0; i--){
        if(stories[i].getPlatform() != null && stories[i].getPlatform().equals("Nintendo Switch")){
            nintendoReviews = nintendoReviews + 1;
        }
    }
%>

<form action="nintendoswitch" method="post">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="viewReviews">Can't Pause It</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="viewReviews">Home</a></li>
                <li><a href="pc">PC</a></li>
                <li><a href="ps3">PS3</a></li>
                <li><a href="ps4">PS4</a></li>
                <li><a href="xbox360">Xbox 360</a></li>
                <li><a href="xboxone">Xbox One</a></li>
                <li class="active"><a href="nintendoswitch">Nintendo Switch</a></li>
                <li><a href="miscellaneous">Miscellaneous</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="welcome">Log Out</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span><%=user.getUsername()%></a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="well well-sm">
                <h3><p class="text-primary"><%=nintendoReviews%> Review(s)</h3>
                <div class="pre-scrollable">
                    <ul class="list-group">
                        <%
                            for (int i = stories.length - 1; i >= 0; i--) {
                                if (stories[i].getCommentOnStoryID() != 0)
                                    continue;
                                if(stories[i].getPlatform().equals("Nintendo Switch")){
                        %>
                        <li class="list-group-item"><%=stories[i].getUsername()%><br />(<%=stories[i].getGame()%>-- <%=stories[i].getPlatform() %>)<br /><%=stories[i].getStory()%><br />                            <input type="submit" class="btn btn-info" name="<%=stories[i].getStoryId()%>" value="View">
                            <%
                                if(user.getUsername().equals(stories[i].getUsername())){
                            %>
                            <input type="submit" class="btn btn-info" name="<%=stories[i].getStoryId()%>" value="Delete">
                            <%
                                }
                                if(user.getUsername() != stories[i].getUsername() || LikeDao.didUserLikeStory(stories[i].getStoryId(), user.getUsername()) == false){
                            %>
                            <input type="submit" class="btn btn-info" name="<%=stories[i].getStoryId()%>" value="Like">
                            <%
                                }
                            %>
                            Likes: <%=LikeDao.getNumberOfLikes(stories[i].getStoryId())%>
                        </li>
                        <%
                                }
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
                        <input type="hidden" class="form-control" id="platform" name="platform" value="Nintendo Switch">
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