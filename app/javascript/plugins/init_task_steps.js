const initTaskSteps = () => {
  const stepElement = document.getElementById('steps')
  const steps = JSON.parse(stepElement.dataset.steps);
  const step = document.getElementById('step-title');
  const yesButton = document.getElementById('yes-button');
  const back = document.getElementById('back-button');
  const noButton = document.getElementById('nope-button');
  let content = document.getElementById('step-content');
  let videoContent = document.getElementById('video-content');
  // const stepContent = document.getElementById('step-content');

  // yesButton.addEventListener('click', () => {
  //   const activeStepId = step.dataset.stepId;
  //   const nextStep = steps.filter(step => step.id > activeStepId)[0];
  //   if (nextStep) {
  //     stepElement.innerHTML = '';
  //     step.dataset.stepId = nextStep.id;
  //     stepElement.innerHTML = nextStep.title;
  //   }
  // });
  console.log(steps);
  const size = steps.length - 1;
  let counter = 0;

  yesButton.addEventListener("click", (event) => {
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
    content.classList.remove("speech-bubble");
    content.innerHTML = '';
    step.innerHTML = steps[counter].title;
    if (counter < 1) {
      back.classList.add('hidden');

    }
    console.log(counter);
  });

  if(content.innerHTML == "") {
    noButton.addEventListener("click", (event) => {
      content.classList.add("speech-bubble");
      content.innerHTML = '';
      content.innerHTML = steps[counter].content;
      if(content.innerHTML === steps[counter].content) {
        noButton.addEventListener("click", (event) => {
          videoContent.classList.remove('hidden');
          videoContent.classList.add("speech-bubble");
        });
      }
    });
  };
};

export { initTaskSteps };
