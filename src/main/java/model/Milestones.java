package model;

public class Milestone {
	private int id;
	private String name;
	private java.sql.Date completionDate;
	private int completed;
	private int projects_id;
	private int status_id;
	
	public Milestone(int id, String name, int status_id, int completed, int projects_id, java.sql.Date completionDate) {
		super();
		this.id = id;
		this.status_id = status_id;
		this.completionDate = completionDate;
		this.name = name;
		this.completed = completed;
		this.projects_id = projects_id;
	}
	
	public Milestone(int completed) {
		super();
		this.completed = completed;
	}
	
	public Milestone(String name, int status_id, int completed, int projects_id, java.sql.Date completionDate) {
		super();
		this.name = name;
		this.status_id = status_id;
		this.completed = completed;
		this.projects_id = projects_id;
		this.completionDate = completionDate;
	}
	
	public Milestone() {
		this(null, 0, 0, 0, null);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCompleted() {
		return completed;
	}
	
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	
	public int getProjects_id() {
		return projects_id;
	}
	
	public void setProjects_id(int projects_id) {
		this.projects_id = projects_id;
	}
	
	public java.sql.Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(java.sql.Date completionDate) {
		this.completionDate = completionDate;
	}

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	@Override
	public String toString() {
		return "Milestones [id=" + id + ", name=" + name + ", completed=" + completed + ", projects_id=" + projects_id
				+ "]";
	}
}
