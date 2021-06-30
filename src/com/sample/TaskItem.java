package com.sample;

public class TaskItem {
	int id;
	String taskContent;
	int month;
	int day;
	String assignee;
	
	public TaskItem(int id, String taskContent, int month, int day, String assignee) {
		super();
		this.id = id;
		this.taskContent = taskContent;
		this.month = month;
		this.day = day;
		this.assignee = assignee;
	}
	
	public int getId() {
		return id;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public int getMonth() {
		return month;
	}

	public int getDay() {
		return day;
	}

	public String getAssignee() {
		return assignee;
	}
}
