import "bootstrap";
import "../plugins/flatpickr"

import { initPlaces } from '../plugins/init_places';
import { initTaskSteps } from '../plugins/init_task_steps';

import { byeWeather } from '../plugins/init_weather';
import { reveal } from '../plugins/init_search';

// import '../components/transaction_form';
// import "../plugins/flatpickr";

const tasksShow = document.querySelector(".tasks.show")

if(tasksShow) {
  initTaskSteps();
}

const registrationsNew = document.querySelector(".registrations.new")

if(registrationsNew) {
  initPlaces();
}

const categoriesIndex = document.querySelector(".categories.index")

if(categoriesIndex) {
  byeWeather();
}

reveal();
