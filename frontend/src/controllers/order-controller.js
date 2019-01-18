function OrderCtrl($state,orders, Order,Session) {
    var vm = this;
    vm.orders=orders;
    vm.logout=logout;
    vm.setOrder=setOrder;

    function logout(){
        Session.destroy();
        $state.go("login", {}, {reload: true});
    }

    function setOrder(response){
        vm.currentOrder = response;

    }
}

angular
    .module("app")
    .controller("OrderCtrl", OrderCtrl);
