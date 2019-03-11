import "bootstrap";
import { initPlaces } from '../plugins/init_places';
import { initTaskSteps } from '../plugins/init_task_steps';
import { byeWeather } from '../plugins/init_weather';
import "../plugins/flatpickr";
import { formToggle } from "../components/transaction_form";

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

const balanceContainer = document.querySelector(".balance-container")

if (balanceContainer) {
  formToggle();
}

