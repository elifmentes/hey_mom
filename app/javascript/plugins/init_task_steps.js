const initTaskSteps = () => {
  const stepElement = document.getElementById('steps')
  const steps = JSON.parse(stepElement.dataset.steps);

  const step = document.getElementById('step-title');
  const yesButton = document.getElementById('yes-button');
  const back = document.getElementById('back-button');
  const noButton = document.getElementById('nope-button');

  const content = document.getElementById('step-content');
  const videoContent = document.getElementById('video-content');
  const googleContent = document.getElementById('google');
  const mom = document.getElementById('mom-final');

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
    window.scrollTo(0,document.body.scrollHeight);
  }

  const showContent = () => {
    showElement(content);
    content.innerHTML = steps[counter].content;
    showElement(mom);
    momAnswer();
  };

  const readYoutube = () => {
    showElement(videoContent);
    const youtubeKey = videoContent.dataset.youtubeApiKey;

    fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&key=${youtubeKey}&q=${steps[counter].title}`)
      .then(response => response.json())
      .then((data) => {
        const result = data.items[0].id["videoId"];
        videoContent.setAttribute("src", `https://www.youtube.com/embed/${result}`);
      });
  };

  const showVideo = () => {
    showContent();
    readYoutube();
  };

  const showGoogle = () => {
    showVideo();

    showElement(googleContent);
    googleContent.setAttribute("target", "_blank")
    googleContent.setAttribute("href", "http://www.google.com");
    googleContent.innerHTML = "Maybe you want to google it dear."
  }

  const clearSections = () => {
    [content, videoContent, googleContent, mom].forEach(element => {
      element.classList.add('hidden');
      element.innerHTML = '';
    });
  }

  noButton.addEventListener('click', (event) => {
    console.log(noCounter);
    // clearSections();
    if (noCounter < 3) {
      if (noCounter === 0) {
        showContent();
      } else if (noCounter === 1) {
        showVideo();
      } else {
        showGoogle();
      }
      scroll();
      noCounter += 1;
    }
  });

  yesButton.addEventListener("click", (event) => {
    clearSections();
    noCounter = 0;

    if (counter < size) {
      counter += 1;

      content.classList.remove("speech-bubble");
      content.innerHTML = '';

      step.innerHTML = '';
      step.innerHTML = steps[counter].title;
    }

    if (counter >= 1) {
      back.classList.remove('hidden');
    }
  });

  back.addEventListener("click", (event) => {
    clearSections();
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
