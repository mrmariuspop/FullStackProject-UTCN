package project.dao;

import org.springframework.data.repository.CrudRepository;

import project.model.User;


public interface UserDao extends CrudRepository<User, Integer>{
	public User findByUsername(String username);
}
