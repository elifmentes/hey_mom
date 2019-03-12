const balanceContainer = document.querySelector(".balance-container");
const balanceContent = document.querySelectorAll(".balance-row");
const transactionForm = document.querySelector(".transaction-form");
const transactionNew = document.getElementById("transaction-new");
const transactionSubmit = document.getElementById("transaction-submit");
const balanceNew = document.querySelector(".balance-new");


const toggleForm = () => { transactionForm.classList.toggle("hidden") };
const toggleButton = () => { balanceNew.classList.toggle("hidden") };
const toggleTransactionContent = () => { balanceContent.forEach((row) => row.classList.toggle("hidden")) };

const togglePage = () => {
  toggleTransactionContent();
  toggleButton();
  toggleForm();
};

const formToggleEvent = (element) => element.addEventListener("click", (event) => {
  togglePage();
});

const formToggle = { formToggleEvent(transactionNew) };
// formToggleEvent(transactionSubmit);

