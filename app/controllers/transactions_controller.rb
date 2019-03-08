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

  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def set_transactions
    @transactions = Transaction.where(user: current_user).order(id: :desc)
  end

  def calculate_balance(expense)
    @subtransactions = @transactions.where('expense = ? AND created_at > ?', expense, 1.month.ago)
    return @subtransactions.map{ |t| t.amount }.sum
  end
end
