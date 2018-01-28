<%@ page import="models.StoryModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datalayer.StoryDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>Unhappy Stories</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="resources/style.css">
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
    StoryModel stories[];
    stories = (StoryModel[]) request.getAttribute("stories");

    if (stories == null) {
        stories = new StoryModel[0];
    }
%>
<p></p>
<p></p>
<div class="container">

    <form action="viewStories" method="post">

        <!-- Display the jumbotron -->
        <div class="jumbotron">
            <h1>Lastest Bad Stuff</h1>
        </div>

        <!-- Display a list of stories -->
        <div class="container">
            <div class="row">
                <div class="well well-sm">
                    <h3><p class="text-primary"><%=stories.length%> Stories</h3>
                    <div class="pre-scrollable">
                        <ul class="list-group">
                            <%
                                for (int i = stories.length - 1; i >= 0; i--) {
                            %>
                            <li class="list-group-item"><%=stories[i].getStory()%>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Input for a new story -->
        <div class="container">
            <div class="row">
                <div class="well well-sm">
                <div class="form-group">
                    <label for="storyText">Tell your story</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="storyText" name="storyText"
                               placeholder="What's your story?">
                    </div>
                    <!-- Button -->
                    <input type="submit" class="btn btn-info" name="submitButton" value="Submit">
                </div>
                </div>
            </div>
        </div>

    </form>
</div>
</body>
</html>
