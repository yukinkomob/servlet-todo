package com.sample;

public class TaskItem {
	int id;
	String taskContent;
	int month;
	int day;
	String assignee;
	boolean isComplete;

	public TaskItem(int id, String taskContent, int month, int day, String assignee) {
		super();
		this.id = id;
		this.taskContent = taskContent;
		this.month = month;
		this.day = day;
		this.assignee = assignee;
		this.isComplete = false;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public boolean getIsComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

}
