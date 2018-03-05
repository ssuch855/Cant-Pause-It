package ui;

import java.io.IOException;
import java.util.logging.Logger;
import datalayer.ReviewDao;
import datalayer.UniqueIdDao;
import datalayer.UserDao;
import models.ReviewModel;
import models.UserModel;

import javax.servlet.RequestDispatcher;

public class SportsGenreServlet extends javax.servlet.http.HttpServlet {

    private Logger logger = Logger.getLogger(getClass().getName());

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        // Before we go the page to display the stories, we need to get the stories.
        // And then shove the stories in to the request.
        //loadStoriesIntoRequest(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/sportsgenre.jsp");
        dispatcher.forward(request, response);
    }
}
