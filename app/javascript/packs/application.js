import "bootstrap";
import { initPlaces } from '../plugins/init_places'
import { initTaskSteps } from '../plugins/init_task_steps'
import "../plugins/flatpickr"

const tasksShow = document.querySelector(".tasks.show")
if(tasksShow) {
  initTaskSteps();
}

const registrationsNew = document.querySelector(".registrations.new")
if(registrationsNew) {
  initPlaces();
}

