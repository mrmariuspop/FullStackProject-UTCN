function AdminProfessorCtrl($state, professors, Admin) {
    var vm = this;

    vm.deleteProfessor = deleteProfessor;
    vm.createProfessor=createProfessor;
    vm.updateProfessor=updateProfessor;
    vm.setProfessor=setProfessor;
    vm.professor={};
    vm.professors = professors;
    vm.errorDelete = false;
    vm.errorUpdate = false;
    vm.errorCreate = false;
    vm.errorMessage="";
    vm.logout=logout;

    function setProfessor(professor){
        angular.copy(professor, vm.professor);
    }

    function createProfessor(professor) {
        Admin.createProfessor(professor)
            .then(function () {
                vm.errorCreate = false;
                angular.element(document.querySelector('#modalCreate')).removeClass('in');
                $state.go("adminProfessorPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorCreate = true;
                vm.errorMessage=response.data.message;
            })
    }
    function updateProfessor() {
        Admin.updateProfessor(vm.professor)
            .then(function () {
                vm.errorUpdate = false;
                angular.element(document.querySelector('#modalUpdate')).removeClass('in');
                $state.go("adminProfessorPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorUpdate = true;
                vm.errorMessage=response.data.message;
            })
    }

    function deleteProfessor(userId){
        Admin.deleteStudentOrProfessor(userId)
            .then(function(){
                vm.errorDelete = false;
                $state.go("adminProfessorPage", {}, {reload: true});
            })
            .catch(function () {
                vm.errorDelete = true;
            })
    }

    function logout(){
        $state.go("login", {}, {reload: true});


    }

}

angular
    .module("app")
    .controller("AdminProfessorCtrl", AdminProfessorCtrl);
