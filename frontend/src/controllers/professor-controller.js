function ProfessorCtrl($state, exams, Professor) {
    var vm = this;

    vm.deleteExam = deleteExam;
    vm.createExam=createExam;
    vm.updateExam=updateExam;
    vm.setExam=setExam;
    vm.goStudentsExam= goStudentsExam;
    vm.exam={};
    vm.exams=exams;
    vm.errorDelete = false;
    vm.errorUpdate = false;
    vm.errorCreate = false;
    vm.errorMessage="";
    vm.logout=logout;

    function setExam(exam){
        angular.copy(exam, vm.exam);
        vm.exam.time=exam.date;
    }

    function createExam(exam) {
        if(!date_check(exam.date)){
            vm.errorCreate = true;
            vm.errorMessage="Invalid date";
            return;
        }
        if(!time_check(exam.time)){
            vm.errorCreate = true;
            vm.errorMessage="Invalid time. Time have to be between 08:00-20:00";
            return;
        }
        exam.date.setHours(exam.time.getHours(),exam.time.getMinutes());
        Professor.createExam(exam)
            .then(function () {
                vm.errorCreate = false;
                angular.element(document.querySelector('#modalCreate')).removeClass('in');
                $state.go("professorPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorCreate = true;
                vm.errorMessage=response.data.message;
            })
    }
    function updateExam() {
        if(!date_check(vm.exam.date)){
            vm.errorUpdate = true;
            vm.errorMessage="Invalid date";
            return;
        }
        if(!time_check(vm.exam.time)){
            vm.errorUpdate = true;
            vm.errorMessage="Invalid time. Time have to be between 08:00-20:00";
            return;
        }
        vm.exam.date.setHours(vm.exam.time.getHours(),vm.exam.time.getMinutes());
        Professor.updateExam(vm.exam)
            .then(function () {
                vm.errorUpdate = false;
                angular.element(document.querySelector('#modalUpdate')).removeClass('in');
                $state.go("professorPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorUpdate = true;
                vm.errorMessage=response.data.message;
            })
    }

    function deleteExam(examid){
        Professor.deleteExam(examid)
            .then(function(){
                vm.errorDelete = false;
                $state.go("professorPage", {}, {reload: true});
            })
            .catch(function () {
                vm.errorDelete = true;
            })
    }

    function goStudentsExam(examid){
        $state.go("studentsExamPage", { examid: examid }, {reload: true});
    }

    function logout(){
        $state.go("login", {}, {reload: true});
    }

    function date_check(date) {
        var currentDate = new Date();
        if (date.getFullYear() > 2020) {
            return false;
        }
        if (date.getFullYear() < currentDate.getFullYear()) {
            return false;
        } else if (date.getFullYear() === currentDate.getFullYear()) {
            if (date.getMonth() < currentDate.getMonth()) {
                return false;
            } else if (date.getMonth() === currentDate.getMonth()) {
                if (date.getDate() < currentDate.getDate()) {
                    return false;
                }
            }
        }
        return true;
    }

    function time_check(date) {
        var h = date.getHours();
        if (h >= 20) {
            return false;
        } else if (h < 8) {
            return false;
        }
        return true;
    }
}

angular
    .module("app")
    .controller("ProfessorCtrl", ProfessorCtrl);
