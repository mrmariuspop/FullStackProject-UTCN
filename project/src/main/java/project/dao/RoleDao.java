package project.dao;


import org.springframework.data.repository.CrudRepository;

import project.model.Role;


public interface RoleDao extends CrudRepository<Role, Integer>{
	public Role findByName(String name);
}
