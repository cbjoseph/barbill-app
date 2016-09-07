/*global angular */
(function() {
  "use strict";
  angular.module("app").controller("orderCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/api/v1/queue").then(function(response) {
        $scope.queueddrinks = response.data;
        console.log($scope.queueddrinks);
      });
    };
     window.scope = $scope;
    $scope.message = "Hello world!";
  });
}());