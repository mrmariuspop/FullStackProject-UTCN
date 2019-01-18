package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.dto.AnnouncementDto;
import project.service.AnnouncementService;

@RestController
@RequestMapping("/announcement")
@CrossOrigin
public class AnnouncementController {

	@Autowired
	private AnnouncementService announcementService;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<AnnouncementDto> allAnnouncements() {
		return announcementService.getAnnouncements();
	}

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<?> addAnnouncement(@RequestBody AnnouncementDto announcementDto) {		
		announcementService.save(announcementDto);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<?> updateAnnouncement(@RequestBody AnnouncementDto announcementDto) {
		announcementService.save(announcementDto);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteAnnouncement(@PathVariable("id") int id) {
		try{
		announcementService.deleteAnnouncement(id);
		 return new ResponseEntity<String>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
	}
}
