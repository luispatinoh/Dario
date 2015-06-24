package com.quest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class encuesta extends HttpServlet {

	private final String folder = "/WEB-INF";

	protected void dojjletjj(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		RequestDispatcher rd = null;

		rd = request.getRequestDispatcher("/success.jsp");
		rd.forward(request, response);

	}

	protected void nuevo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("saludo", "Bienvenido a JSP");
		request.getRequestDispatcher("encuesta.nueva.jsp").forward(request,
				response);

	}
	

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// String action = request.getServletPath();
		String action = request.getContextPath();
		switch (action) {
		case "/nuevo.encuesta":
			nuevo(request, response);
			break;
		default:
			break;
		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}