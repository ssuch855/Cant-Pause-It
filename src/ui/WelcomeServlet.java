package ui;

import javax.servlet.RequestDispatcher;
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
        String buttonValue = request.getParameter("button");

        if (buttonValue != null && buttonValue.equals("Create Account")){
            // one day maybe we'll do something.
        }

        if (buttonValue != null && buttonValue.equals("Create Account")){
            // one day maybe we'll check that user id and ask for password.
        }

        // Let's just show the stories!
        RequestDispatcher dispatcher=request.getRequestDispatcher("/viewStories");
        dispatcher.forward(request, response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome.jsp");
        dispatcher.forward(request, response);
    }

}
