package project.dto;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class ExamDto {
	private int examId;
	private String title;
	private String room;
	private Date date;
	private Set<UserExamDto> userExam = new HashSet<>();
	
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Set<UserExamDto> getUserExam() {
		return userExam;
	}
	public void setUserExam(Set<UserExamDto> userExam) {
		this.userExam = userExam;
	}
	
	
	
}
