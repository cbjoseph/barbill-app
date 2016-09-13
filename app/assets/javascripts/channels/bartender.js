App.bartender = App.cable.subscriptions.create("BartenderChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var $scope = angular.element(document.getElementById('orderCtrl')).scope();
    $scope.setup(data);
    // Called when there's incoming data on the websocket for this channel
  }
});
