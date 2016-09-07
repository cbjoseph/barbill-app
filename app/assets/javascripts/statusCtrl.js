/* global angular */
// require textbelt-- TextBelt.text('5614147798', 'Your drink order is ready')
(function() {
  "use strict";

  angular.module("app").controller("statusCtrl", function($scope, $http) {
    $scope.setup = function(id) {
      $http.get("/api/v1/orders/" + id ).then(function(response) {
        $scope.order = response.data;
        $scope.cartedDrinks = $scope.order.carteddrinks;
        $scope.statuses = [];
      });
    };
    window.scope = $scope;
    $scope.message = "Hello world!";

    $scope.orderStatusMaking = function() {
      if (!$scope.cartedDrinks) {
        return;
      }
      // var status = [];
      // for (var i = 0; i < $scope.cartedDrinks.length; i++) {
      //   if ($scope.cartedDrinks[i].status !== "purchased") {
      //     return true;
      //     } else {
      //       return false;
      //     }
      //   }
      for (var i = 0; i < $scope.cartedDrinks.length; i++) {
        $scope.statuses.push($scope.cartedDrinks[i].status);
      }

      if($scope.statuses.indexOf("purchased") == -1 || $scope.statuses.indexOf("making") !== -1 || $scope.statuses.indexOf("completed") !== -1 ){
        return true;
      } else {
        return false;
      }

    };
    $scope.orderStatusCompleted = function() {
      
      if (!$scope.cartedDrinks) {
        return;
      }
      var status = [];
      for (var i = 0; i < $scope.cartedDrinks.length; i++) {
        if ($scope.cartedDrinks[i].status !== "completed") {
          status.push($scope.cartedDrinks[i].status);
        }
      }
      if (status.length > 0) {
        return false;
      } else {
        console.log(Date.now());
        return true;
      }
    };
  });

}());