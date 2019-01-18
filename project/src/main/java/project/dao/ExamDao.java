package project.dao;

import org.springframework.data.repository.CrudRepository;

import project.model.Exam;

public interface ExamDao extends CrudRepository<Exam, Integer> {

}
