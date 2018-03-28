package ui;

import datalayer.ReviewDao;
import datalayer.UniqueIdDao;
import datalayer.UserDao;
import models.ReviewModel;
import models.UserModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Logger;

public class Xbox360Servlet extends javax.servlet.http.HttpServlet  {
    private Logger logger = Logger.getLogger(getClass().getName());

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        logRequestParameters(request);  // Just to help with debugging.

        // Get data from the request
        UserModel user = loadUserFromRequest(request);
        String reviewText=request.getParameter("storyText");
        String game=request.getParameter("game");
        String genre =request.getParameter("genre");
        String platform=request.getParameter("platform");
        String buttonValue = request.getParameter("submitButton2");

        if (buttonValue != null && buttonValue.equals("Submit")){
            addStory(user, reviewText, game, genre, platform);
        }

        // Load any data we need on the page into the request.
        request.setAttribute("user", user);
        loadStoriesIntoRequest(request);

        // Show the page
        RequestDispatcher dispatcher=request.getRequestDispatcher("/pcpage.jsp");
        dispatcher.forward(request, response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        // Before we go the page to display the stories, we need to get the stories.
        // And then shove the stories in to the request.
        loadStoriesIntoRequest(request);
        loadUserFromRequest(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pcpage.jsp");
        dispatcher.forward(request, response);
    }

    private void loadStoriesIntoRequest(HttpServletRequest request) {
        ArrayList<ReviewModel> storiesList = ReviewDao.getStories();

        // We're going to convert the array list to an array because it works better in the JSP.
        ReviewModel[] stories = storiesList.toArray(new ReviewModel[storiesList.size()]);
        request.setAttribute("stories", stories);
    }

    private void addStory(UserModel user, String reviewText, String game, String genre, String platform) {
        if (reviewText != null && reviewText.length() > 0 && user != null) {
            ReviewDao.saveStory(UniqueIdDao.getID(), reviewText, user.getUsername(), 0, game, genre, platform);
        }
    }

    /**
     * Grab the username from the request and create a user model.
     */
    private UserModel loadUserFromRequest(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        UserModel user = UserDao.getUser(username);

        // If there is no user for some weird reason, just use anonymous.
        if (user == null) {
            user = new UserModel();
            user.setUsername("anonymous");
        }

        request.setAttribute("user", user);
        return user;
    }

    private void logRequestParameters(javax.servlet.http.HttpServletRequest request) {
        Enumeration<String> params = request.getParameterNames();
        while(params.hasMoreElements()){
            String paramName = params.nextElement();
            logger.info("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
        }
    }
}
