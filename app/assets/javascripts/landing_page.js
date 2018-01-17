function initiateMap() {

  if (document.body.dataset.env === 'test') {
    var pos = JSON.parse(document.getElementById('fake_position').content);
    displayMap(pos)
  } else {
      navigator.geolocation.getCurrentPosition(displayMap);
  }

}

function displayMap(pos) {
    var coords = pos.coords;
    console.log(pos.coords);
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: coords.latitude,
        lng: coords.longitude
    });
    addMarkers()
}

function addMarkers() {
    restaurants.forEach(function (item) {
        map.addMarker({
            lat: item.latitude,
            lng: item.longitude,
            title: item.name,
            infoWindow: {
                content: '<h4>' + item.name + '</h4><p>' + item.city +'</p>'
            }
        });
      });
    }
