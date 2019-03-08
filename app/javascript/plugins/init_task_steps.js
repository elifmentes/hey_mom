const initTaskSteps = () => {
  const stepElement = document.getElementById('steps')
  const steps = JSON.parse(stepElement.dataset.steps);
  const step = document.getElementById('step-title');
  const yesButton = document.getElementById('yes-button');
  const back = document.getElementById('back-button');
  const noButton = document.getElementById('nope-button');
  let content = document.getElementById('step-content');
  let videoContent = document.getElementById('video-content');
  let googleContent = document.getElementById('google');

  const size = steps.length - 1;
  let counter = 0;

  yesButton.addEventListener("click", (event) => {
    videoContent.classList.add("hidden");
    googleContent.classList.add("hidden");
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
    console.log(counter);
  });

  back.addEventListener("click", (event) => {
    counter -= 1;
    googleContent.classList.add("hidden");
    videoContent.classList.add("hidden");
    content.classList.remove("speech-bubble");
    content.innerHTML = '';
    step.innerHTML = steps[counter].title;
    if (counter < 1) {
      back.classList.add('hidden');

    }
    console.log(counter);
  });

  const scroll = () => {
    window.scrollTo(0,document.body.scrollHeight);
  }

  const youtubeKey = videoContent.dataset.youtubeApiKey;

  const insertVideo = (data) => {
    const result = data.items[0].id["videoId"];
    videoContent.setAttribute("src", `https://www.youtube.com/embed/${result}`)
  }

  const readYoutube = () => {
    fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&key=${youtubeKey}&q=${steps[counter].title}`)
      .then(response => response.json())
      .then(insertVideo);
  };

  console.log("content ", content);


  if(content.innerHTML == "") {
    noButton.addEventListener("click", (event) => {
      videoContent.classList.add("hidden");
      googleContent.classList.add("hidden");
      content.classList.add("speech-bubble");
      content.innerHTML = '';
      content.innerHTML = steps[counter].content;
      console.log("content2 ", content);
      scroll();
      if(content.innerHTML === steps[counter].content) {
        noButton.addEventListener("click", (event) => {
          googleContent.classList.add("hidden");
          console.log("googleContent", googleContent);
          videoContent.classList.remove("hidden");
          videoContent.classList.add("speech-bubble");
          readYoutube();
          scroll();
          if(videoContent.classList.contains("speech-bubble")){
            noButton.addEventListener("click", (event) => {
              googleContent.classList.remove("hidden");
              googleContent.classList.add("speech-bubble");
              googleContent.setAttribute("target", "_blank")
              googleContent.setAttribute("href", "http://www.google.com");
              scroll();
            });
          }
        });
      }
    });
  };
};

export { initTaskSteps };
