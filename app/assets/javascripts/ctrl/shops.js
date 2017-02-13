//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller('SingleShopCtrl', ['$scope',function($scope) {
  //Funcs


}]);

app.controller('ShopCartCtrl', ['$scope','$rootScope','orders','$timeout','api',function($scope,$rootScope,orders,$timeout,api) {
  //init
  $scope.shopId=urlParams[urlParams.length - 2];

  //listener
  $scope.$watchCollection('dishes', function(newCol, oldCol, scope) {

    $scope.updateDishesOrders();
  });

  $scope.init=function() {
    $scope.dishes=[];
    $timeout(function(){
      $rootScope.$broadcast('shop', { id: $scope.shopId, name:"马上下单", mode:1 });
      $rootScope.$broadcast('info', { name: "订单",engName:"ORDER FOR GOODS"});
      for (var i=0;i<orders.items.length;i++) {
        if (orders.items[i]!=null) {
          api.getSingleItem($scope.shopId, orders.items[i].item_id).then(function(data) {
            $scope.dishes.push(data);
          });
        }
      }

    });
  }
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
        $scope.dishes[i].count = orders.findItem($scope.dishes[i].id).quantity ;
      }
    }
  }

  $scope.init();


}]);


