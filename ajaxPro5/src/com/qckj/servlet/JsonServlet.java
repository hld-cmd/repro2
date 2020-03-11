package com.qckj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qckj.entitybean.UserBean;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class JsonServlet
 */
@WebServlet("/jsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserBean> list = new ArrayList<UserBean>();
		for (int i = 0; i <= 10; i++) {
			UserBean user = new UserBean();
			user.setUserid(i+1);
			user.setUsername("username"+(i+1));
			list.add(user);
		}
		JSONArray jsonobj = JSONArray.fromObject(list);
		System.out.println("======="+jsonobj.toString());
		PrintWriter out = response.getWriter();
		out.write(jsonobj.toString());
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
