function initiateMap () {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
};

function geoLocate () {
  map.addMarker({
    lat: -12.043333,
    lng: -77.028333,
    title: 'Lima',
    click: function(e) {
      alert('You clicked in this marker');
    }
  });
}
