import places from 'places.js';

const initPlaces = () => {
  const locationInput = document.getElementById('user_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initPlaces };
