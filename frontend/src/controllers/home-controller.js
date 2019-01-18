function HomeCtrl($state, Home, Session) {
  var vm = this;
  vm.credentials = {};
  vm.login = login;
  vm.badCredentials = false;
  vm.logout=logout;


   function logout(){
     Session.destroy();
       $state.go("login", {}, {reload: true});
   }

  function login() {
    Home.login(vm.credentials)
      .then(function (response) {
        Session.setUsername(response.username);
        if (response.role.name === 'ROLE_STUDENT'){
          $state.go("studentPage", {studentid : response.userid}, {reload: true});
        }
        else if (response.role.name === 'ROLE_ADMIN'){
           $state.go("adminStudentPage", {}, {reload: true});
         }
        else if (response.role.name === 'ROLE_PROFESSOR'){
            $state.go("professorPage", {}, {reload: true});
        }
        else {
          vm.badCredentials = true;
        }
      })
      .catch(function () {
        vm.badCredentials = true;
      })
  }
}

angular
  .module("app")
  .controller("HomeCtrl", HomeCtrl);
