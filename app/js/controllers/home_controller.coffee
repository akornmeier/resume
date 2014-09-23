angular.module("app").controller "HomeController", ["$scope", "$location",
($scope, $location) ->

  # $scope.messageArgs =
  #   name: ""
  #   email: ""
  #   subject: ""
  #   message: ""

  $scope.menu = ["hello", "about", "experience", "contact"]
  index = _.indexOf($scope.menu, $location.path().replace("/", ""))
  $scope.selectedIndex = index
  $scope.selectedIndex = 0 if index < 0

  $scope.$watch "selectedIndex", (newVal, oldVal) ->
    $scope.hidePrev = $scope.hidePrevious(newVal)
    $scope.hideNext = $scope.hideForward(newVal)
    $scope.pageClass = $scope.menu[newVal]

  # Put watch on these two vars to make the values update when they change.

  $scope.pickMe = ($index) ->
    $scope.selectedIndex = $index
    $location.path $scope.menu[$index]

  $scope.nextPage = ->
    index = _.indexOf($scope.menu, $location.path().replace("/", "")) + 1

    # Exit if this is the last page
    return  if index >= $scope.menu.length

    $scope.selectedIndex = index
    $location.path $scope.menu[index]

  $scope.prevPage = ->
    index = _.indexOf($scope.menu, $location.path().replace("/", "")) - 1

    # Exit if this is the last page
    return  if index < 0

    $scope.selectedIndex = index
    $location.path $scope.menu[index]

  $scope.hidePrevious = (i) ->
    i is 0

  $scope.hideForward = (i) ->
    i + 1 is $scope.menu.length

  ]
