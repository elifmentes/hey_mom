const balanceContainer = document.querySelector(".balance-container");
const balanceContent = document.querySelectorAll(".balance-row");
const transactionForm = document.querySelector(".transaction-form");
const transactionNew = document.getElementById("transaction-new");
const balanceNew = document.querySelector(".balance-new");


const toggleForm = () => { transactionForm.classList.toggle("hidden") };
const toggleButton = () => { balanceNew.classList.toggle("hidden") };
const toggleTransactionContent = () => { balanceContent.forEach((row) => row.classList.toggle("hidden")) };

const formToggleEvent = transactionNew.addEventListener("click", (event) => {
  toggleTransactionContent();
  toggleButton();
  toggleForm();
});

const formToggle = () => { formToggleEvent };


export { formToggle };
