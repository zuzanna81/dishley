function initiateMap() {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
    addMarkers();
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
