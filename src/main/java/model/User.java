package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class User {
	public int id = 0;
	private String name;
	private String username;
	private String password;
	private String email;
	private int remember;
	
	
	public User(String name, String username, String password, String email, int remember) {
		super();
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.remember = remember;
		encryptPassword();
	}
	
	public void encryptPassword() {
		System.out.println("encryptPassword Function: "+getPassword());
		
		String encrytedPW="";
		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			md5.update(getPassword().getBytes(), 0, getPassword().length());
			encrytedPW = new BigInteger(1, md5.digest()).toString(16);
		} catch (Exception e) {
			System.err.println("Error encrypting the password - " + getPassword());
			System.out.println(e);
		}
		
		setPassword(encrytedPW);
	}
	
	public User() {
		this(null, null, null, null, 0);
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setPasswordEncryption(String password) {
		this.password = password;
		encryptPassword();
	}
	
	public int getRemember() {
		return remember;
	}
	
	public void setRemember(int remember) {
		this.remember = remember;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password + ", email="
				+ email + ", remember=" + remember + "]";
	}
}
