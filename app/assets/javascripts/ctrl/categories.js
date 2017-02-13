//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller('singleCategoryCtrl', ['$scope', 'api', '$rootScope', 'orders',function($scope, api, $rootScope, orders) {
  //Funcs
  $scope.getSingleCategory = function(shopId, categoryId) {
    api.getSingleCategory(shopId, categoryId).then(function(data) {
      $scope.dishes = data.items;
      //Name of category pending api update
      $rootScope.$broadcast('singleCategory', { name: data.name });
      $rootScope.$broadcast('shop', { id: urlParams[urlParams.length - 3],name:"确认", mode:0 });
      $scope.updateDishesOrders();
    }, function(error) {

    });
  };
  $scope.addItem = function(itemId, price) {
    orders.updateItem(itemId, price, true);
    $scope.updateDishesOrders();
  }
  $scope.minusItem = function(itemId, price) {
    orders.updateItem(itemId, price, false);
    $scope.updateDishesOrders();
  }
  $scope.updateDishesOrders = function() {
    for (var i = 0; i < $scope.dishes.length; i++) {
      if (orders.items[i] != null) {
        $scope.dishes[i].count = $scope.orders.findItem($scope.dishes[i].id).quantity;
      }
    }
  }
  $scope.orders = orders;
  $scope.getSingleCategory(urlParams[urlParams.length - 3], urlParams[urlParams.length - 1]);
}]);
