package project.dto;

import java.util.HashSet;
import java.util.Set;

public class UserDto {

	private int userid;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private int group;
	private Set<UserExamDto> userExam = new HashSet<>();
	private RoleDto role;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public Set<UserExamDto> getUserExam() {
		return userExam;
	}
	public void setUserExam(Set<UserExamDto> userExam) {
		this.userExam = userExam;
	}
	public RoleDto getRole() {
		return role;
	}
	public void setRole(RoleDto role) {
		this.role = role;
	}
	
	
}
