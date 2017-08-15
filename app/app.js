var app = angular.module('myApp', ['ngRoute', 'ui.bootstrap', 'ngAnimate','datatables','ngResource']);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
	when('/examresult/:examtaken', {
      title: 'Result',
      templateUrl: 'partials/showresult.html',
      controller: 'resultCtrl'
	}).
	when('/questions/:examtaken', {
      title: 'Questions',
      templateUrl: 'partials/questions.html',
      controller: 'questionsCtrl'
	}).
	when('/exams', {
      title: 'Questions',
      templateUrl: 'partials/exams.html',
      controller: 'examsCtrl'
	}).
	when('/myresults', {
      title: 'MyResults',
      templateUrl: 'partials/myresults.html',
      controller: 'myresultsCtrl'
	}).
	otherwise({
      redirectTo: '/exams'
    });
}]);
    