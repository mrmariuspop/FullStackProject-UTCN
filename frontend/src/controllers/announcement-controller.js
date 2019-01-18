function AnnouncementCtrl($state, announcements, Announcement) {
    var vm = this;

    vm.deleteAnnouncement = deleteAnnouncement;
    vm.createAnnouncement = createAnnouncement;
    vm.updateAnnouncement = updateAnnouncement;
    vm.setAnnouncement = setAnnouncement;
    vm.announcement = {};
    vm.announcements = announcements;
    vm.errorDelete = false;
    vm.errorUpdate = false;
    vm.errorCreate = false;
    vm.errorMessage = "";
    vm.logout = logout;

    function setAnnouncement(announcement) {
        angular.copy(announcement, vm.announcement);
    }

    function createAnnouncement(announcement) {
        Announcement.createAnnouncement(announcement)
            .then(function () {
                vm.errorCreate = false;
                angular.element(document.querySelector('#modalCreate')).removeClass('in');
                $state.go("announcementPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorCreate = true;
                vm.errorMessage = response.data.message;
            })
    }

    function updateAnnouncement() {
        Announcement.updateAnnouncement(vm.announcement)
            .then(function () {
                vm.errorUpdate = false;
                angular.element(document.querySelector('#modalUpdate')).removeClass('in');
                $state.go("announcementPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorUpdate = true;
                vm.errorMessage = response.data.message;
            })
    }

    function deleteAnnouncement(announcementId) {
        Announcement.deleteAnnouncement(announcementId)
            .then(function () {
                vm.errorDelete = false;
                $state.go("announcementPage", {}, {reload: true});
            })
            .catch(function () {
                vm.errorDelete = true;
            })
    }

    function logout() {
        $state.go("login", {}, {reload: true});
    }
}
angular
    .module("app")
    .controller("AnnouncementCtrl", AnnouncementCtrl);
