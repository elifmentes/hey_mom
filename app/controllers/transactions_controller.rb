class TransactionsController < ApplicationController
  before_action :set_transactions
  def index
    @monthly_income = calculate_balance(false)
    @monthly_expense = calculate_balance(true)
    @transaction = Transaction.new
  end

  def create
    @monthly_income = calculate_balance(false)
    @monthly_expense = calculate_balance(true)
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    if @transaction.save
      respond_to do |format|
        format.html { redirect_to transactions_path }
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js
      end
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
