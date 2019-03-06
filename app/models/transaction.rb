class Transaction < ApplicationRecord
  belongs_to :user

  validates :user, :amount, presence: true
end
