import Countdown from "countdown-js"
import swal from 'sweetalert'

const initTimer = () => {
  var min = document.getElementById('minute').value
    var sec = document.getElementById('second').value;

    if (min === "") {
      min = 0;
    }

    if (sec === "") {
      sec = 0;
    }

    const minInput = document.getElementById('minute');
    const secInput = document.getElementById('second');
    const timeResult = document.getElementById('timer');
    const resetTimer = () => {
      minInput.value = '';
      secInput.value = '';
      timeResult.innerHTML = '00:00'
    };


    const end = new Date(new Date().getTime() + (min * 60 + sec) * 1000);

    const timer = Countdown.timer(end, (timeLeft) => {
       var newMin = timeLeft.minutes;
       var newSec = timeLeft.seconds;
       var display = document.getElementById("timer");
       display.innerHTML = newMin + ":" + newSec;
    }, function() {
      swal({
        title: "Get Ready!",
        text: "Time is up!",
        icon: "success",
      });
      resetTimer();
    });
};

export { initTimer };



