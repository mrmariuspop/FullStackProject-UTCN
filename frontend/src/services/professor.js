function Professor($http) {
    return {
        getAllExams: getAllExams,
        createExam:createExam,
        updateExam:updateExam,
        deleteExam:deleteExam

    };

    function getAllExams(){
        return $http.get("http://localhost:8080/professor")
            .then(function (response) {
                response.data.forEach(function(i) {
                    i.date=new Date(i.date);
                });
                return response.data;
            });
    }
    function createExam(exam){
        return $http.post("http://localhost:8080/professor",exam)
            .then(function (response) {
                return response.data;
            });
    }
    function updateExam(exam){
        return $http.put("http://localhost:8080/professor",exam)
            .then(function (response) {
                return response.data;
            });
    }
    function deleteExam(id){
        return $http.delete("http://localhost:8080/professor/"+ id)
            .then(function (response) {
                return response.data;
            });
    }


}

angular
    .module("app")
    .service("Professor", Professor);
