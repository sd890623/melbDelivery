app.service('api', ['$http', '$q','orders',function($http, $q,orders) {
  this.config = {
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
    }
  }
  this.getSingleItem = function(shopId, itemId) {
    return $q(function(resolve, reject) {
      $http.get("/shop/items/" + itemId + ".json")
        .then(function(data, status, headers, config) {
            resolve(data.data);
          },
          function(data, status, headers, config) {
            reject(data);
            console.log(error);
          });
    });
  }
  this.getSingleCategory = function(shopId, categoryId) {
    return $q(function(resolve, reject) {
      $http.get("/shops/" + shopId + "/categories/" + categoryId + ".json")
        .then(function(data, status, headers, config) {
            resolve(data.data);
          },
          function(data, status, headers, config) {
            reject(data);
            console.log(error);
          });
    });
  }
  this.getNewOrder = function(shopId) {
    return $q(function(resolve, reject) {
      $http.get("/shops/" + shopId + "/order.json")
        .then(function(data, status, headers, config) {
            resolve(data.data);
          },
          function(data, status, headers, config) {
            reject(data);
            console.log(error);
          });
    });
  }
  this.postNewOrder = function(shopId,params) {
    return $q(function(resolve, reject) {
      var postObject={shop_id:shopId};
      orders.getOrders(shopId);
      postObject["cart"]=orders.items;
      postObject["order"]=params;
      postObject["order"]["delivery_method"]=postObject["order"]["delivery_method"].val;
      postObject["order"]["delivery_time"]=postObject["order"]["delivery_time"].val;


      $http.post("/shops/" + shopId + "/orders",postObject)
        .then(function(data, status, headers, config) {
            resolve(data.data);
            if (data.status==200) {
              orders.deleteOrder(shopId);
              window.location.replace("/my/orders");
            }
          },
          function(data, status, headers, config) {
            reject(data);
            console.log(error);
          });
    });
  }
}]);



app.service('orders', ['$http', '$q',function($http, $q) {
  this.items = [];
  this.shopId = 0;
  this.price = 0;
  this.count = 0;
  this.getOrders = function(shopId) {
      if (localStorage != null && JSON != null) {
        var cart = JSON.parse(localStorage.getItem(shopId));
        if (cart) {
          this.items = cart;
          this.setTotalCount();
          this.setTotalPrice();
        }
      } else {
        console.log("The browser does not support simpleStorage service");
      }
      this.shopId = shopId;
    },
    this.findItem=function(itemId) {
      for (var i=0;i<this.items.length;i++) {
        if (this.items[i].item_id==itemId) {
          return this.items[i];
        }
      }
      return null;
    }
    this.updateItem = function(itemId, price, add) {
      if (this.findItem(itemId) != null) {
        var item=this.findItem(itemId);
        if (add) {
          item["quantity"] += 1;
        } else {
          if (item["quantity"] > 0) {
            item["quantity"] -= 1;
          }
        }
      } else {
        if (add) {
          this.items.push({ "item_id":itemId, "price": price, "quantity": 1 });
        } else {
          this.items.push({ "item_id":itemId, "price": price, "quantity": 0 });
        }
      }
      this.setTotalCount();
      this.setTotalPrice();
      this.saveJson(this.shopId);
    },
    this.deleteOrder = function(shopId) {
      localStorage.removeItem(shopId);
    },
    this.setTotalCount = function() {
      this.count = 0;
      for (var i = 0; i < this.items.length; i++) {
        if (this.items[i] != null) {
          this.count += this.items[i]["quantity"];
        }
      }
    },
    this.getTotalCount = function() {
      return this.count;
    },
    this.setTotalPrice = function() {
      this.price = 0;
      for (var i = 0; i < this.items.length; i++) {
        if (this.items[i] != null) {
          this.price += this.items[i]["price"] * this.items[i]["quantity"];
        }
      }
    },
    this.getTotalPrice = function() {

      return this.price;
    },
    this.saveJson = function(shopId) {
      localStorage.setItem(shopId, JSON.stringify(this.items));
    }
}]);
app.service('mapTable', function() {
  this.createLabel=function(dataArray,value,label) {
    for (var i=0;i<dataArray.length;i++) {
      if (dataArray[i]==value) {
        dataArray[i]={val:value,label:label};
      }
    }
  }
});
