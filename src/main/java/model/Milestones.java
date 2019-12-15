package model;

public class Milestones {
	private int id;
	private String name;
	private int completed;
	private int projects_id;
	
	
	
	public Milestones(int id, String name, int completed, int projects_id) {
		super();
		this.id = id;
		this.name = name;
		this.completed = completed;
		this.projects_id = projects_id;
	}
	
	public Milestones() {
		this(0,null, 0, 0);
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
	@Override
	public String toString() {
		return "Milestones [id=" + id + ", name=" + name + ", completed=" + completed + ", projects_id=" + projects_id
				+ "]";
	}
	
	
}
