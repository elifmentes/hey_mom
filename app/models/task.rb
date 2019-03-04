class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :steps

  validates :title, :category, :user, presence: true
end
