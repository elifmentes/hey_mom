class TransactionsController < ApplicationController
  before_action :set_transactions
  def index
    @monthly_income = calculate_balance(false)
    @monthly_expense = calculate_balance(true)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  private

  def set_transactions
    @transactions = Transaction.where(user: current_user).order(id: :desc)
  end

  def calculate_balance(expense)
    @subtransactions = @transactions.where('expense = ? AND created_at > ?', expense, 1.month.ago)
    return @subtransactions.map{ |t| t.amount }.sum
  end

  def transaction_params
    params.require(:transaction).permit(:category, :description, :amount, :date, :expense)
  end
end
