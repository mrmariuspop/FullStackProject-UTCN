function AdminStudentCtrl($state, students, Admin) {
  var vm = this;

  vm.deleteStudent = deleteStudent;
  vm.createStudent=createStudent;
  vm.updateStudent=updateStudent;
  vm.setStudent=setStudent;
  vm.student={};
  vm.students = students;
  vm.errorDelete = false;
  vm.errorUpdate = false;
  vm.errorCreate = false;
  vm.errorMessage="";
  vm.logout=logout;

  function setStudent(student){
      angular.copy(student, vm.student);
  }

  function createStudent(student) {
      Admin.createStudent(student)
          .then(function () {
              vm.errorCreate = false;
              angular.element(document.querySelector('#modalCreate')).removeClass('in');
              $state.go("adminStudentPage", {}, {reload: true});
            })
          .catch(function (response) {
              vm.errorCreate = true;
              vm.errorMessage=response.data.message;
          })
  }
    function updateStudent() {
        Admin.updateStudent(vm.student)
            .then(function () {
                vm.errorUpdate = false;
                angular.element(document.querySelector('#modalUpdate')).removeClass('in');
                $state.go("adminStudentPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorUpdate = true;
                vm.errorMessage=response.data.message;
            })
    }

  function deleteStudent(userId){
    Admin.deleteStudentOrProfessor(userId)
        .then(function(){
            vm.errorDelete = false;
        $state.go("adminStudentPage", {}, {reload: true});
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
  .controller("AdminStudentCtrl", AdminStudentCtrl);
