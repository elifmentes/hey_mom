class TransactionsController < ApplicationController
  before_action :set_transactions
  def index
  end

  private

  def set_transactions
    @transactions = Transaction.where(user: current_user)
  end
end
