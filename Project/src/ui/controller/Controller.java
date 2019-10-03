package ui.controller;

import domain.db.PersonDbInMemory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    private PersonDbInMemory personDb = new PersonDbInMemory();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command == null)
            command = "";

        String destination;

        switch (command) {
            case "overview":
                request.setAttribute("persons", personDb.getAll());
                destination = "personoverview.jsp";
                break;
            case "signUp":
                destination = "signUp.jsp";
                break;
            default:
                destination = "index.jsp";
        }

        request.getRequestDispatcher(destination).forward(request, response);
    }
}
