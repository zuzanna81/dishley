function initiateMap () {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
    geoLocate(57.7089,11.9746);
}

function geoLocate (lat, lng) {
  map.addMarker({
    lat: lat,
    lng: lng,
    title: "Somewhere",
    click: function(e) {
      alert('You clicked in this marker');
    }
  });
}
