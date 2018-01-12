function initiateMap () {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
    geoLocate();
}

function geoLocate (lat, lng, name) {
  map.addMarker({
    lat: 57.7089,
    lng: 11.9746,
    title: "Gothenburg",
    click: function(e) {
      alert('You clicked in this marker');
    }
  });
}
