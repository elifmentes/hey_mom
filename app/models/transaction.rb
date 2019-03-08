class Transaction < ApplicationRecord
  belongs_to :user

  validates :user, :description, presence: true
  validates :expense, inclusion: { in: [true, false] }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: %w[Housing Debt Transportation Food Personal Other] }
  validates :description, length: { maximum: 25 }
end
