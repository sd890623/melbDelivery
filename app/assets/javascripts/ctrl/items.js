//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller('singleItemCtrl', ['$scope', 'api', '$rootScope', 'orders',function($scope, api, $rootScope, orders) {
  //Funcs
  $scope.getSingleItem = function(shopId, itemId) {
    api.getSingleItem(shopId, itemId).then(function(data) {
      $scope.item = data;
      $rootScope.$broadcast('singleDish', { name: data.name });
      $rootScope.$broadcast('shop', { id: data.shop_id, name:"确认", mode:0 });
      $scope.updateDishOrders();
    }, function(error) {

    });
  };
  $scope.addItem = function(itemId, price) {
    orders.updateItem(itemId, price, true);
    $scope.updateDishOrders();
  }
  $scope.minusItem = function(itemId, price) {
    orders.updateItem(itemId, price, false);
    $scope.updateDishOrders();
  }
  $scope.updateDishOrders = function() {
    if (orders.findItem($scope.item.id) != null) {
      $scope.item.count = orders.findItem($scope.item.id).quantity;
    }
  }
  $scope.getSingleItem("", urlParams[urlParams.length - 1]);
}]);
