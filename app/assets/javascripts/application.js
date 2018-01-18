//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require gmaps

document.addEventListener("turbolinks:load", function () {
  initiateMap();
  getPosition({ enableHighAccuracy: true }).then(function (position) {
      setCookie('geocoderLocation', JSON.stringify(position.coords)).then(function () {
          redirectWithLocation();
          document.body.dataset.geocoded = true;
      }).catch(function (error) {
          return console.log(error);
      });
  }).catch(function (error) {
      return console.log(error);
  });
});

getPosition = function getPosition(options) {
    if (document.body.dataset.env === 'test') {
        return new Promise(function (resolve) {
            var fakePosition = JSON.parse(document.getElementById('fake_position').content);
            resolve({ coords: { latitude: fakePosition.lat, longitude: fakePosition.lng } });
        });
    } else {
        return new Promise(function (resolve, reject) {
            navigator.geolocation.getCurrentPosition(function (position) {
                return resolve(position);
            }, function (error) {
                return reject(error);
            }, options);
        });
    }
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

setCookie = function setCookie(name, value) {
    var days = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 7;
    var path = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : '/';

    return new Promise(function (resolve) {
        var expires = new Date(Date.now() + days * 864e5).toUTCString();
        document.cookie = name + '=' + encodeURIComponent(value) + '; expires=' + expires + '; path=' + path;
        resolve();
    });
};
