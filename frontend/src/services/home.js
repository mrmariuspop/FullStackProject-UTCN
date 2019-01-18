function Home($http) {
  return {
    login: login
  };

  function login(user) {
    return $http.post("http://localhost:8080/login", user)
      .then(function (response) {
        return response.data;
      });
  }
}

angular
  .module("app")
  .service("Home", Home);
