//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller('ShopOrderCtrl', ['$scope', '$rootScope', 'orders', '$timeout', 'api', 'mapTable', function($scope, $rootScope, orders, $timeout, api, mapTable) {
  //funcs
  $scope.init = function(shopId) {
    api.getNewOrder(shopId).then(function(data) {
      $scope.info = data;
      orders.getOrders(shopId);
      $rootScope.$broadcast('info', { name: "提交订单" });
      $scope.$broadcast('data-load');
      //dummy data
      $scope.info.phone = "0424710623";
      $scope.info.delivery_fee=23;
      $scope.orderFee=orders.price;
    }, function(error) {

    });
  }
  $scope.validClass = function(item) {
    if (item.$valid) {
      return 'has-success';
    }
    else {
    	return 'has-error';
    }
  }
  $scope.submit = function() {
    api.postNewOrder(shopId,$scope.info);
  }

  //listener
  $scope.$on('data-load', function(event, args) {
    mapTable.createLabel($scope.info.delivery_options, 'self', '自取');
    mapTable.createLabel($scope.info.delivery_options, 'delivery', '送货上门');
    $scope.info.delivery_method = $scope.info.delivery_options[0];
  });

  //init
  var shopId=urlParams[urlParams.length - 2];
  $scope.init(shopId);
  //dummy data
  $scope.deliveryTimes = [{ val:"soon", id: 0, label: '尽快送到' }, { val:"19", id: 4, label: '19点到20点' }, { val:"20",id: 5, label: '20点到21点' }, { val:"21",id: 6, label: '21点到22点' }, { val:"22",id: 7, label: '22点到23点' }, { val:"23",id: 8, label: '23点到24点' }];
  $scope.deliveryTypes = [{ id: 0, label: '配送' }, { id: 1, label: '到店自取' }];
  $scope.voucherList = [{ id: 0, label: '不使用',val:"no", discount: {} }, { id: 1, label: '折扣券',val:"0.1", discount: {} }];

}]);
