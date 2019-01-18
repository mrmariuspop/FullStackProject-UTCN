function Student($http) {
    return {
        getAllStudentExams: getAllStudentExams

    };

    function getAllStudentExams(studentid){
        return $http.get("http://localhost:8080/student/"+studentid)
            .then(function (response) {
                response.data.forEach(function(i) {
                    i.date=new Date(i.date);
                });
                return response.data;
            });
    }
}

angular
    .module("app")
    .service("Student", Student);
