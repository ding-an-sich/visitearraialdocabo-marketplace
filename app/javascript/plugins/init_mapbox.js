import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });


    const bounds = new mapboxgl.LngLatBounds();
    // stretches the bound to max longitude and latitude of markers
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    // tells the map to respect the bounds!
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });

  }
};

    export { initMapbox };
