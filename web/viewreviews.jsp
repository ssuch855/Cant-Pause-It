<%@ page import="models.ReviewModel" %>
<%@ page import="models.UserModel" %>
<%@ page import="datalayer.LikeDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>All Reviews</title>
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
    .w3-row-padding img {margin-bottom: 12px}
    /* Set the width of the sidebar to 120px */
    .w3-sidebar {width: 120px;background: #222;}
    /* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
    #main {margin-left: 120px}
    /* Remove margins from "page content" on small screens */
    @media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black"/>
<link rel="stylesheet" href="resources/review.css">

</head>
<body>
<!-- Let's start by loading information we expect in the request.
     For any info missing, we'll just fake it.
  -->
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
