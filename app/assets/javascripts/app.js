var app = angular.module('delivery', []);
var baseUrl = window.location.origin;
var url = window.location.href;
var urlParams = url.split("/");
app.controller('headerCtrl', ['$scope', 'api', function($scope, api) {
  //Funcs
  $scope.$on('singleDish', function(event, args) {
    $scope.header = args.name;
    $scope.engHeader = args.engName;

  });
  $scope.$on('singleCategory', function(event, args) {
    $scope.header = args.name;
    $scope.engHeader = args.engName;
  });
  $scope.$on('info',function(event,args) {
    $scope.header = args.name;
    $scope.engHeader = args.engName;
  })

  //Init
  $scope.header = "墨尔本送餐";
  $scope.engHeader = "Best delivery platform in Melbourne";
}]);

app.controller('cartCtrl', ['$scope','$rootScope','api', 'orders',function($scope,$rootScope, api, orders) {
  //Funcs
  $rootScope.$on('shop', function(event, args) {
    var shopId = args.id;
    orders.getOrders(shopId);
    $scope.showCart = true;
    $scope.buttonName=args.name;
    if (args.mode==0) {
      $scope.url="/shops/"+shopId+"/cart";
    }
    else if (args.mode==1) {
      $scope.url="/shops/"+shopId+"/order";
    }
  });
  $scope.orders = orders;

}]);
