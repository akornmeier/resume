angular.module("app").config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true

  $routeProvider.when "/hello",
    templateUrl: "home.html"
    #controller: "HomeController"

  $routeProvider.when "/about",
    templateUrl: "about.html"
    #controller: "HomeController"

  $routeProvider.when "/experience",
    templateUrl: "experience.html"
    #controller: "HomeController"

  $routeProvider.when "/contact",
    templateUrl: "contact.html"
    #controller: "HomeController"

  $routeProvider.otherwise redirectTo: "/hello"

]
