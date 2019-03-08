const weatherBox = document.querySelector(".weather-box")

const byeWeather = () => { setTimeout(() => weatherBox.remove(), 20000) };

export { byeWeather };
