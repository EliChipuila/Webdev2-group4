package model;

public class Project { 
	private int id;
	private String name;
	private String description;
	private String completionDate;
	private String intendedDate;
	private int user_id;
	private int completed;
	private int status_id;
	private int modules_id;
	
	
	public Project(int id, String description, String name, String completionDate, String intendedDate, int user_id, int completed,
			int status_id, int modules_id) {
		super();
		this.id = id;
		this.description = description;
		this.name = name;
		this.completionDate = completionDate;
		this.intendedDate = intendedDate;
		this.user_id = user_id;
		this.completed = completed;
		this.status_id = status_id;
		this.modules_id = modules_id;
	}
	
	
	
	public Project(String name, String description, String completionDate, String intendedDate, int user_id, int completed,
			int status_id, int modules_id) {
		super();
		this.name = name;
		this.description = description;
		this.completionDate = completionDate;
		this.intendedDate = intendedDate;
		this.user_id = user_id;
		this.completed = completed;
		this.status_id = status_id;
		this.modules_id = modules_id;
	}
	
	public Project() {
		this(0, null, null, null, null, 0, 0, 0, 0);
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
	
	public String getCompletionDate() {
		return completionDate;
	}
	
	public void setCompletionDate(String completionDate) {
		this.completionDate = completionDate;
	}
	
	public String getIntendedDate() {
		return intendedDate;
	}
	
	public void setIntendedDate(String intendedDate) {
		this.intendedDate = intendedDate;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getCompleted() {
		return completed;
	}
	
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	
	public int getStatus_id() {
		return status_id;
	}
	
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	
	public int getModules_id() {
		return modules_id;
	}
	
	public void setModules_id(int modules_id) {
		this.modules_id = modules_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
