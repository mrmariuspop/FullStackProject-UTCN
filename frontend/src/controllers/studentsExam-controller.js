function StudentsExamCtrl($state, $stateParams, students, studentsNotAttendExam, StudentsExam) {
    var vm = this;
    var ctx;
    vm.deleteStudentFromExam = deleteStudentFromExam;
    vm.addStudent = addStudent;
    vm.updateStudentGrade = updateStudentGrade;
    vm.setStudentExam = setStudentExam;
    vm.generateChart=generateChart;
    vm.studentExam = {};
    vm.students = students;
    vm.studentsNotAttendExam = studentsNotAttendExam;
    vm.errorDelete = false;
    vm.errorUpdate = false;
    vm.errorCreate = false;
    vm.errorMessage = "";
    vm.logout = logout;

    function setStudentExam(studentExam) {
        angular.copy(studentExam, vm.studentExam);
    }

    function addStudent(student) {
        StudentsExam.addStudentToExam($stateParams.examid, student)
            .then(function () {
                StudentsExam.getAllStudentsForOneExam($stateParams.examid)
                    .then(function (response) {
                        vm.students = response;
                        var index = vm.studentsNotAttendExam.indexOf(student);
                        vm.studentsNotAttendExam.splice(index, 1);
                        vm.errorCreate = false;
                    });
            })
            .catch(function (response) {
                vm.errorCreate = true;
                vm.errorMessage = response.data.message;
            })
    }

    function updateStudentGrade() {
        StudentsExam.updateStudentGrade(vm.studentExam)
            .then(function () {
                vm.errorUpdate = false;
                angular.element(document.querySelector('#modalUpdate')).removeClass('in');
                $state.go("studentsExamPage", {}, {reload: true});
            })
            .catch(function (response) {
                vm.errorUpdate = true;
                vm.errorMessage = response.data.message;
            })
    }

    function deleteStudentFromExam(id) {
        StudentsExam.deleteStudentFromExam(id)
            .then(function () {
                vm.errorDelete = false;
                $state.go("studentsExamPage", {}, {reload: true});
            })
            .catch(function () {
                vm.errorDelete = true;
            })
    }

    function logout() {
        $state.go("login", {}, {reload: true});
    }

    function createChart(list){
        ctx=new Chart(document.getElementById("line-chart").getContext('2d'), {
            type:    'line',
            data:    {
                labels: ['Not graded','1','2','3','4','5','6','7','8','9','10'],
                datasets: [
                    {
                        label: 'Number of grades',
                        data: list,
                        fill: false,
                        borderColor: "#3e95cd",
                        backgroundColor: "#3e95cd"
                    }
                ]
            },
            options: {
                responsive: true,
                title:      {
                    display: true,
                    text: 'Grades'
                },
                scales:     {
                    xAxes: [{
                        scaleLabel: {
                            display:     true,
                            labelString: 'Grade'
                        }
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display:     true,
                            labelString: 'Number of grades'
                        },
                        ticks: {
                             stepSize: 1
                            }
                    }]
                }
            }
        });
    }

    function generateChart(){
        StudentsExam.getGrades($stateParams.examid)
            .then(function (grades) {
                var histogram=[0,0,0,0,0,0,0,0,0,0,0];
                for(var i=0; i<grades.length;i++){
                    for(var j=0; j<11;j++){
                        if(Math.round(grades[i])===j)
                            histogram[j]+=1;
                    }
                }
                createChart(histogram);
            })
            .catch(function () {

            });
    }

}
angular
    .module("app")
    .controller("StudentsExamCtrl", StudentsExamCtrl);
