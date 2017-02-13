app.filter('nullImageFilter', function() {
  return function(input) {
    if (input == null || input == "") {
      return baseUrl + "/assets/error.gif";
    } else {
      return input;
    }
  };
});
