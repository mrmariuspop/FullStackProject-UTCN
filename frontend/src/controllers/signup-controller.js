function SignUpCtrl($state, SignUp2, Session) {
    var vm = this;
    vm.credentials = {};
    vm.SignUp = SignUp1;
    vm.badCredentials = false;


    function SignUp1() {
        if (vm.form.$invalid) {
            return;
        }
        SignUp2.addUser(vm.credentials)
            .then(function (response) {
                Session.setUsername(response.username);
                $state.go("userPage", {}, {reload: true});

            })
            .catch(function () {
                vm.badCredentials = true;
            })
            .finally(function () {
            });
    }
}

angular
    .module("app")
    .controller("SignUpCtrl", SignUpCtrl);
