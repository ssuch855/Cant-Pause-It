package ui;

import datalayer.UserDao;
import models.UserModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.logging.Logger;

public class WelcomeServlet extends javax.servlet.http.HttpServlet {
    private Logger logger = Logger.getLogger(getClass().getName());

    /**
     * The post method is called by the browser when the user presses the button
     *
     * @param request The request has info on filled in fields and button presses.
     * @param response We use this to give the browser a response.
     * @throws javax.servlet.ServletException
     * @throws IOException
     */
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        UserModel user = null;

        // Load data from the request
        String buttonValue = request.getParameter("button");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String name=request.getParameter("name");

        // Create an account
        //&& username != null && username.length() > 0 && password != null && password.length() > 0 && name != null
        if (buttonValue != null && buttonValue.equals("Create Account")){
            if(username != null && username.length() > 0 && password != null && password.length() > 0 && name != null) {
                user = new UserModel();
                user.setUsername(username);
                user.setName(name);
                user.setPassword(password);
                UserDao.saveUser(user);
                request.getSession().setAttribute("user", user.getUsername());
                request.getSession().setAttribute("username", user.getUsername());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/viewReviews");
                dispatcher.forward(request, response);
            }
            else {
                String errorMessage = "Please fill all fields";
                request.setAttribute("errorMessage", errorMessage);
            }
        }

        // Or log in
        else if (buttonValue != null && buttonValue.equals("Log In")) {
            user = UserDao.getUser(username);
            if (user != null && username != null && username.length() > 0 && password != null && password.length() > 0 && name != null) {
                if(password.equals(user.getPassword())){
                    request.getSession().setAttribute("user", user);
                    request.getSession().setAttribute("username", user.getUsername());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/viewReviews");
                    dispatcher.forward(request, response);
                }
                else{
                    String errorMessage = "Incorrect password";
                    request.setAttribute("errorMessage", errorMessage);
                }
            }
            else{
                String errorMessage = "Incorrect username or password";
                request.setAttribute("errorMessage", errorMessage);
            }
        }

        // Load any data we need on the page into the request.


        // Show the stories page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * The get method is invoked when the user goes to the page by browser URI.
     */
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome.jsp");
        dispatcher.forward(request, response);
    }

}
