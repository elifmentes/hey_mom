import $ from 'jquery';

const dropdown = document.querySelector(".dropdown")
const dropdownMenu = document.querySelector(".dropdown-menu")

const animated = () => {
  $('#slide').on('click', function() {
    $(this).find('.dropdown-menu').animate({width: 'toggle'}, 120);
  });

};

export { animated }

