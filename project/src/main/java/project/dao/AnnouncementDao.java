package project.dao;

import org.springframework.data.repository.CrudRepository;

import project.model.Announcement;

public interface AnnouncementDao extends CrudRepository<Announcement, Integer> {

}
