import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/itin-builder522/ckltkvxwd2jhd17o8wqv8kq1o'
  });
};

const findMarkerColor = (category) => {
  let newColor = "#000";
  switch (category) {
    case "Restaurants":
      newColor = "#FFB86F";
      break;
    case "Museums":
      newColor = "#6BA368";
      break;
    case "Landmarks":
      newColor = "#CA807D";
      break;
    case "Activities":
      newColor = "#2A3B7A";
      break;
    default:
      newColor
      break;
  }
  return newColor;
}

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('i');
    element.className = 'fas fa-map-marker-alt fa-4x';
    element.style.textShadow = '0 4x 4x rgba(0,0,0,0.2)';
    element.style.color = findMarkerColor(marker.category);

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, speed: 10 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ 
      accessToken: mapboxgl.accessToken,
      marker: {
        color: '#283A53'
      },
      mapboxgl: mapboxgl 
    }));
  }
};

window.initMapbox = initMapbox;
export default initMapbox;
