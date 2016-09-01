App.activity = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var $scope = angular.element(document.getElementById('statusCtrl')).scope();
    $scope.setup(data.order_id);
    // Called when there's incoming data on the websocket for this channel
  }
});