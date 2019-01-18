function config($urlRouterProvider, $stateProvider) {

  $urlRouterProvider.when('','login');

  $stateProvider
        .state('login', {
          url: '/login',
          templateUrl: 'src/templates/homePage.html',
          controller: 'HomeCtrl as homeCtrl'
        })
        .state('adminStudentPage', {
          url: '/adminStudentPage',
          templateUrl: 'src/templates/adminStudentPage.html',
          controller: 'AdminStudentCtrl as adminCtrl',
          resolve: {
            students: getAllStudents
          }
        })
      .state('adminProfessorPage', {
          url: '/adminProfessorPage',
          templateUrl: 'src/templates/adminProfessorPage.html',
          controller: 'AdminProfessorCtrl as adminProfessorCtrl',
          resolve: {
              professors: getAllProfessors
          }
      })
      .state('professorPage', {
          url: '/professorPage',
          templateUrl: 'src/templates/professorPage.html',
          controller: 'ProfessorCtrl as professorCtrl',
          resolve: {
              exams: getAllExams
          }
      })
      .state('announcementPage', {
          url: '/announcementPage',
          templateUrl: 'src/templates/announcementPage.html',
          controller: 'AnnouncementCtrl as announcementCtrl',
          resolve: {
              announcements: getAllAnnouncements
          }
      })
      .state('studentsExamPage', {
          url: '/studentsExamPage?examid',
          templateUrl: 'src/templates/studentsExamPage.html',
          controller: 'StudentsExamCtrl as studentsExamCtrl',
          resolve: {
              students: getAllStudentsForOneExam,
              studentsNotAttendExam: getAllStudentsWhichNotAttendTheExam
          }
      })
      .state('studentPage', {
          url: '/studentPage?studentid',
          templateUrl: 'src/templates/studentPage.html',
          controller: 'StudentCtrl as studentCtrl',
          resolve: {
              exams: getAllStudentExams,
              announcements : getAllAnnouncements
          }
      });

    function getAllStudents(Admin){
        return Admin.getAllStudents();
    }
    function getAllProfessors(Admin) {
        return Admin.getAllProfessors();
    }
    function getAllExams(Professor){
        return Professor.getAllExams();
    }
    function getAllAnnouncements(Announcement){
        return Announcement.getAllAnnouncements();
    }
    function getAllStudentsForOneExam(StudentsExam,$stateParams){
        return StudentsExam.getAllStudentsForOneExam($stateParams.examid);
    }
    function getAllStudentsWhichNotAttendTheExam(StudentsExam,$stateParams){
        return StudentsExam.getAllStudentsWhichNotAttendTheExam($stateParams.examid);
    }
    function getAllStudentExams(Student,$stateParams){
        return Student.getAllStudentExams($stateParams.studentid);
    }
}

function run() {

}

angular
  .module("app", ["ui.router"])
  .config(config)
  .run(run);
