function Announcement($http) {
    return {
        getAllAnnouncements: getAllAnnouncements,
        createAnnouncement:createAnnouncement,
        updateAnnouncement:updateAnnouncement,
        deleteAnnouncement:deleteAnnouncement
    };

    function getAllAnnouncements(){
        return $http.get("http://localhost:8080/announcement")
            .then(function (response) {
                return response.data;
            });
    }
    function createAnnouncement(announcement){
        return $http.post("http://localhost:8080/announcement", announcement)
            .then(function (response) {
                return response.data;
            });
    }
    function updateAnnouncement(announcement){
        return $http.put("http://localhost:8080/announcement", announcement)
            .then(function (response) {
                return response.data;
            });
    }
    function deleteAnnouncement(id){
        return $http.delete("http://localhost:8080/announcement/"+ id)
            .then(function (response) {
                return response.data;
            });
    }
}

angular
    .module("app")
    .service("Announcement", Announcement);
