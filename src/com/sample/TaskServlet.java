package com.sample;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/task")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Object argIsNew = request.getParameter("isNew");
		boolean isNew = argIsNew != null ? argIsNew.equals("true") : false;
		
		if (isNew) {
			List<TaskItem> list = (List<TaskItem>) session.getAttribute("list");
			
			if (list == null) {
				list = new ArrayList<>();
			}
			
			Integer id = (Integer) session.getAttribute("id");
			if (id == null) {
				id = 0;
			}
			
			String monthStr = request.getParameter("month");
			int month = monthStr != null ? Integer.parseInt(monthStr) : -1; 
			String dayStr = request.getParameter("day");
			int day = dayStr != null ? Integer.parseInt(dayStr) : -1;
			
			String taskContent = request.getParameter("task_content");
			String assignee = request.getParameter("assignee");
			
			TaskItem item = new TaskItem(id + 1, taskContent, month, day, assignee);
			
			list.add(item);
			session.setAttribute("list", list);
			session.setAttribute("id", id + 1);
			
			request.setAttribute("taskItem", item);
			
			RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
			rd.forward(request, response);

		} else {
			boolean isEdit = (request.getParameter("edit") != null);
			boolean isDelete = (request.getParameter("delete") != null);
			
			if (isEdit || isDelete) {
				String id = request.getParameter("index");
				System.out.println(id);
				List<TaskItem> list = (List<TaskItem>) session.getAttribute("list");
				if (list.size() <= 0) {
					return;
				}				
				if (isEdit) {
					
				} else if (isDelete) {
					int idNum = Integer.parseInt(id);
					if (idNum <= 0) {
						return;
					}
					list.remove(idNum - 1);
					session.setAttribute("id", idNum - 1);
					session.setAttribute("list", list);
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
				rd.forward(request, response);
			}
			
			// ƒRƒƒ“ƒg‚Ìˆ—
			
//			List<MeetupMessage> list = (List<MeetupMessage>) session.getAttribute("list");
//			
//			if (list == null) {
//				list = new ArrayList<>();
//			}
//			
//			Integer id = (Integer) session.getAttribute("id");
//			if (id == null) {
//				id = 0;
//			}
//			
//			String name = request.getParameter("name");
//			String comment = request.getParameter("comment");
//			
//			MeetupMessage msg = new MeetupMessage(id + 1, name, new Date(), comment);
//			
//			list.add(msg);
//			session.setAttribute("list", list);
//			session.setAttribute("id", id + 1);
//			
//			request.setAttribute("msg", msg);
//			
//			RequestDispatcher rd = request.getRequestDispatcher("/meetup.jsp");
//			rd.forward(request, response);
		}
	}

}
