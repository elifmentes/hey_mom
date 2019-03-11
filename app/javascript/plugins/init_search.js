const glass = document.getElementById("glass")
const form = document.getElementById("form-search")


const hidden = () => {
  form.style.visibility = "hidden";
};

const reveal = () => {
  hidden();
  glass.addEventListener("click", (event) => {
    form.style.visibility = "visible"
  });
};


export { reveal };
