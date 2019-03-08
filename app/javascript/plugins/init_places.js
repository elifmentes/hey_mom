import places from 'places.js';


const reconfigurableOptions = {
  type: 'city', // Search only for cities names
  aroundLatLngViaIP: false // disable the extra search/boost around the source IP
};

const initPlaces = () => {
  const locationInput = document.getElementById('user_location');
  if (locationInput) {
    places({ container: locationInput },reconfigurableOptions);
  }
};

export { initPlaces };
