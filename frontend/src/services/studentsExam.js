function StudentsExam($http) {
    return {
        getAllStudentsForOneExam: getAllStudentsForOneExam,
        addStudentToExam:addStudentToExam,
        updateStudentGrade:updateStudentGrade,
        deleteStudentFromExam:deleteStudentFromExam,
        getAllStudentsWhichNotAttendTheExam: getAllStudentsWhichNotAttendTheExam,
        getGrades:getGrades
    };

    function getAllStudentsForOneExam(examid){
        return $http.get("http://localhost:8080/studentsExam/"+ examid)
            .then(function (response) {
                return response.data;
            });
    }
    function getAllStudentsWhichNotAttendTheExam(examid){
        return $http.get("http://localhost:8080/studentsExam/students_not_attend/"+ examid)
            .then(function (response) {
                return response.data;
            });
    }
    function getGrades(examid){
        return $http.get("http://localhost:8080/studentsExam/grades/"+ examid)
            .then(function (response) {
                return response.data;
            });
    }
    function addStudentToExam(examid, student){
        return $http.post("http://localhost:8080/studentsExam/"+ examid, student)
            .then(function (response) {
                return response.data;
            });
    }
    function updateStudentGrade(studentExam){
        return $http.put("http://localhost:8080/studentsExam", studentExam)
            .then(function (response) {
                return response.data;
            });
    }
    function deleteStudentFromExam(id){
        return $http.delete("http://localhost:8080/studentsExam/"+ id)
            .then(function (response) {
                return response.data;
            });
    }
}

angular
    .module("app")
    .service("StudentsExam", StudentsExam);
