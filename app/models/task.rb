class Task < ApplicationRecord
  belongs_to :category
  has_many :steps

  validates :title, :category, presence: true
end
