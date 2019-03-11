const initTimer = () => {
  let minute = document.getElementById('minute');
  let second = document.getElementById('second');

  const timeButton = document.getElementById('time-button');
  timeButton.addEventListener(event => {
    countdown();
  });
};

export { initTimer };



