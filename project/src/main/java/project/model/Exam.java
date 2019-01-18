package project.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Exam {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "examId", nullable = false, unique = true)
	private int examId;

	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "room", nullable = false)
	private String room;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date date;

	@OneToMany(mappedBy = "exam", cascade = CascadeType.REMOVE)
	private Set<UserExam> userExam = new HashSet<>();

	public Exam() {

	}

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

	public Set<UserExam> getUserExam() {
		return userExam;
	}

	public void setUserExam(Set<UserExam> userExam) {
		this.userExam = userExam;
	}

}