package com.qckj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WeatherServlet
 */
@WebServlet("/weatherServlet")
public class WeatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeatherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strsrc = request.getParameter("weaimg");
		String str = strsrc.substring(strsrc.indexOf(".jpg")-1, strsrc.indexOf(".jpg"));
		System.out.println("======"+str);
		int wea = Integer.parseInt(str);
		int id = 0;
		while (true){
			Random r = new Random();
			id = r.nextInt(9) +1;
			if (wea !=id) {
				break;
			}
		}
		System.out.println("-----------------------------");
		PrintWriter out = response.getWriter();
		out.write("images/"+id+".jpg");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
