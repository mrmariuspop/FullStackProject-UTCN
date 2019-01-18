function StudentCtrl($state, exams, announcements) {
    var vm = this;

    vm.exams = exams;
    vm.announcements = announcements;
    vm.logout=logout;

    function logout(){
        $state.go("login", {}, {reload: true});
    }

}

angular
    .module("app")
    .controller("StudentCtrl", StudentCtrl);
