//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require gmaps

document.addEventListener("turbolinks:load", function () {
  initiateMap();
  getPosition({ enableHighAccuracy: true }).then(function (position) {
    redirectWithLocationparams(position);
  }).catch(function (error) {});
});

getPosition = function getPosition(options) {
  return new Promise(function (resolve, reject) {
    navigator.geolocation.getCurrentPosition(function (position) {
      resolve(position);
    }, function (error) {
      reject(error);
    }, options);
  });
};

redirectWithLocationParams = function redirectWithLocationparams(position) {
  var lat = poistion.coords.latitude,
      lng = position.coords.longitude,
      url = new URL(window.location.href),
      params = { lat: lat, lng: lng };

  Object.keys(params).forEach(function (key) {
    url.searchParams.append(key, params[key]);
  });

  if (document.body.dataset.geocoded != 'true') {
      document.body.dataset.geocoded = true;
      window.location.replace(url);
  }
};
