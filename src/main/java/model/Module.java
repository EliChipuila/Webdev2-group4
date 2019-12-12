package model;

public class Module {
	private int id = 0;
	private String name;
	private String description;
	private int status_id;
	private int user_id;
	
	public Module(int id, String name, String description, int status_id, int user_id) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.status_id = status_id;
		this.user_id = user_id;
	}
	
	public Module(String name, String description, int status_id, int user_id) {
		super();
		this.name = name;
		this.description = description;
		this.status_id = status_id;
		this.user_id = user_id;
	}
	
	public Module(String name, String description, int status_id) {
		super();
		this.name = name;
		this.description = description;
		this.status_id = status_id;
	}
	
	public Module() {
		this(null, null, 0, 0);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getStatus_id() {
		return status_id;
	}
	
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	@Override
	public String toString() {
		return "Module [id=" + id + ", name=" + name + ", description=" + description + ", status_id=" + status_id
				+ ", user_id=" + user_id + "]";
	}
	
	
	
}
