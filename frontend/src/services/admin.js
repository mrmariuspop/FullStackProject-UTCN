function Admin($http) {
  return {
      getAllStudents: getAllStudents,
      createStudent: createStudent,
      updateStudent:updateStudent,
      deleteStudentOrProfessor:deleteStudentOrProfessor,
      getAllProfessors:getAllProfessors,
      createProfessor:createProfessor,
      updateProfessor:updateProfessor
  };

  function getAllStudents(){
    return $http.get("http://localhost:8080/admin")
      .then(function (response) {
        return response.data;
      });
  }
  function createStudent(student){
      return $http.post("http://localhost:8080/admin", student)
          .then(function (response) {
              return response.data;
          })
  }
  function updateStudent(student){
      return $http.put("http://localhost:8080/admin", student)
          .then(function (response) {
              return response.data;
          });
  }
   function deleteStudentOrProfessor(id){
       return $http.delete("http://localhost:8080/admin/"+ id)
           .then(function (response) {
               return response.data;
           });
   }
   function getAllProfessors(){
       return $http.get("http://localhost:8080/admin/professors")
           .then(function (response) {
               return response.data;
           });
   }
   function createProfessor(professor){
       return $http.post("http://localhost:8080/admin/professors",professor)
           .then(function (response) {
               return response.data;
           });
   }
    function updateProfessor(professor){
        return $http.put("http://localhost:8080/admin/professors",professor)
            .then(function (response) {
                return response.data;
            });
    }

}

angular
  .module("app")
  .service("Admin", Admin);
