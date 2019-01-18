package project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import project.model.UserExam;


public interface UserExamDao extends CrudRepository<UserExam, Integer> {
	@Query(
	        value ="SELECT user_exam.grade FROM user_exam WHERE user_exam.examid= :examid", 
	        nativeQuery=true
		    )
	public List<Double> getGrades(@Param("examid") int examId);
}
