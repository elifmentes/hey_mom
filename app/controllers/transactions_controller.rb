class TransactionsController < ApplicationController
  before_action :set_transactions
  def index
    @monthly_income = calculate_balance(false)
    @monthly_expense = calculate_balance(true)
  end

  private

  def set_transactions
    @transactions = Transaction.where(user: current_user)
  end

  def calculate_balance(expense)
    @subtransactions = @transactions.where('expense = ? AND created_at > ?', expense, 1.month.ago)
    return @subtransactions.map{ |t| t.amount }.sum
  end
end
