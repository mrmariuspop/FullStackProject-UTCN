package project.dto;

public class UserExamDto {
	private int id;

	private double grade;

	private UserDto user;

	private ExamDto exam;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public UserDto getUser() {
		return user;
	}

	public void setUser(UserDto user) {
		this.user = user;
	}

	public ExamDto getExam() {
		return exam;
	}

	public void setExam(ExamDto exam) {
		this.exam = exam;
	}
	
	
}
