const submit = document.getElementById('search_submit');
const input = document.getElementById('search');


const reveal = () => {
  // set initial state:
  input.focused = false;

  submit.addEventListener('click', function(e) {
    e.preventDefault();
    if (input.focused) {
      input.blur();
      input.focused = false;
    } else {
      input.focus();
      input.focused = true;
    }
  });
};

export { reveal }
