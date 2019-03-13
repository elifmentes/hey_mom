const weatherBox = document.querySelector(".weather-box")

const byeWeather = () => {
  console.log(weatherBox);
  setTimeout(() => weatherBox.remove(), 20000)
};

export { byeWeather };
