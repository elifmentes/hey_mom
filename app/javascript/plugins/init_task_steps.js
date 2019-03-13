import { initTimer } from './init_timer'

const initTaskSteps = () => {
  const stepElement = document.getElementById('steps')
  const steps = JSON.parse(stepElement.dataset.steps);

  const step = document.getElementById('step-title');
  const yesButton = document.getElementById('yes-button');
  const back = document.getElementById('back-button');
  const noButton = document.getElementById('nope-button');
  const timeButton = document.getElementById('time-button');

  const content = document.getElementById('step-content');
  const image = document.getElementById('step-image');
  const videoContent = document.getElementById('video-content');
  const key = document.getElementById('key');
  const googleContent = document.getElementById('google');
  const mom = document.getElementById('mom-final');
  const home = document.getElementById('home-button');

  let counter = 0;
  let noCounter = 0;
  const size = steps.length - 1;

  const momAnswers = ["Did you understand sweety? 😘",
  "🥰 Love is it clear enough for you?",
  "Are you sure that you gonna be able to manage this darling? 🤔",
  "Are you eating enough fruits and vegetables? 🥦🥝🥬🥒🍏🥗",
  "Did you text me earlier?",
  "How can you be sure?",
  "Are you reading this?",
  "And by the way please stop changing the google logo so much! I like the original one.",
  "Could i text 911?",
  "Honey, do you even have friends? Anyway, did you get what i'm saying???",
  "😎🥰😘🤪🤱🏻💃🏼🐹🐬🌺🦚🧸"];

  const momAnswer = () => {
    mom.innerHTML = momAnswers[Math.floor(Math.random() * momAnswers.length)];
  };

  const showElement = element => {
    element.classList.remove('hidden');
    element.classList.add('speech-bubble');
  }

  const scroll = () => {
    window.scrollTo(0, document.body.scrollHeight);
  };

  const showImage = () => {
    showElement(image);
    image.innerHTML = `<img src="${steps[counter].image}" alt="">`;
  };

  const showContent = () => {
    if(steps[counter].image !== "") {
      showImage();
    }

    showElement(content);
    content.innerHTML = steps[counter].content;
  };


  const readYoutube = () => {
    const youtubeKey = videoContent.dataset.youtube;

    fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&key=${youtubeKey}&q=${steps[counter].title}`)
      .then(response => response.json())
      .then((data) => {
        if (data.items.length > 0) {
          showElement(videoContent);
          videoContent.innerHTML = `
            <iframe id="key" src="" frameborder="0" allowfullscreen></iframe>
          `;
          const result = data.items[0].id["videoId"];
          videoContent.querySelector('iframe').setAttribute("src", `https://www.youtube.com/embed/${result}`);
          scroll();
        } else {
          showGoogle();
          noCounter += 1;
        }
    });
  };

  const showVideo = () => {
    showContent();
    readYoutube();
    scroll();
  };

  const showGoogle = () => {
    showVideo();

    showElement(googleContent);
    googleContent.setAttribute("target", "_blank")
    googleContent.setAttribute("href", "http://www.google.com");
    googleContent.innerHTML = "Maybe you want to google it dear."
  }

  const clearHome = () => {
    home.classList.add('hidden');
  }

  const clearSections = () => {
    [content, videoContent, googleContent, mom, image].forEach(element => {
      element.classList.add('hidden');
      element.innerHTML = '';
    });
  }

  showElement(mom);
  momAnswer();

  noButton.addEventListener('click', (event) => {
    console.log(noCounter);
    // clearSections();
    if (noCounter < 4) {
      if (noCounter === 0) {
        if (steps[counter].image !== "") {
          showImage();
        } else {
          showContent();
          noCounter += 1;
        }
      } else if (noCounter === 1) {
        showContent();
      } else if (noCounter === 2) {
        showVideo();
      } else {
        showGoogle();
      }
      scroll();
      noCounter += 1;
    }
  });

  timeButton.addEventListener('click', (event) => {
    initTimer();
  });

  yesButton.addEventListener("click", (event) => {
    clearSections();
    showElement(mom);
    momAnswer();
    noCounter = 0;

    if (counter < size) {
      counter += 1;

      content.classList.remove("speech-bubble");
      content.innerHTML = '';

      step.innerHTML = '';
      step.innerHTML = steps[counter].title;
    } else if (counter === size) {
      counter += 1;
      showElement(home);
    } else {
      window.location = "/categories";
    }

    if (counter >= 1) {
      back.classList.remove('hidden');
    }
  });

  back.addEventListener("click", (event) => {
    clearHome();
    clearSections();
    showElement(mom);
    momAnswer();
    noCounter = 0;

    counter -= 1;

    content.classList.remove("speech-bubble");

    content.innerHTML = '';
    step.innerHTML = steps[counter].title;

    if (counter < 1) {
      back.classList.add('hidden');
    }
  });
};


export { initTaskSteps };
