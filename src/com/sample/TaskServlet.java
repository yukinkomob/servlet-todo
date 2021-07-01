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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			boolean isComplete = (request.getParameter("complete") != null);
			boolean isIncomplete = (request.getParameter("incomplete") != null);

			List<TaskItem> list = (List<TaskItem>) session.getAttribute("list");
			if (list.size() <= 0) {
				RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
				rd.forward(request, response);
				return;
			}

			if (isEdit || isDelete) {
				String idStr = request.getParameter("index");
				if (idStr == null) {
					return;
				}

				if (isEdit) {
					int idNum = Integer.parseInt(idStr);
					if (idNum <= 0) {
						throw new IllegalStateException();
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

					TaskItem item = list.get(idNum - 1);
					item.setTaskContent(taskContent);
					item.setMonth(month);
					item.setDay(day);
					item.setAssignee(assignee);

				} else if (isDelete) {
					int idNum = Integer.parseInt(idStr);
					if (idNum <= 0) {
						throw new IllegalStateException();
					}
					list.remove(idNum - 1);
					session.setAttribute("id", idNum - 1);
					session.setAttribute("list", list);
				}
			} else if (isComplete) {
				String idStr = request.getParameter("complete");
				if (idStr == null) {
					return;
				}
				int idNum = Integer.parseInt(idStr);
				if (idNum <= 0) {
					throw new IllegalStateException();
				}
				TaskItem item = list.get(idNum - 1);
				item.setComplete(true);
			} else if (isIncomplete) {
				String idStr = request.getParameter("incomplete");
				if (idStr == null) {
					return;
				}
				int idNum = Integer.parseInt(idStr);
				if (idNum <= 0) {
					throw new IllegalStateException();
				}
				TaskItem item = list.get(idNum - 1);
				item.setComplete(false);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
			rd.forward(request, response);
		}
	}

}
