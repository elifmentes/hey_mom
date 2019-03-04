class Step < ApplicationRecord
  belongs_to :task
  has_many :instructions

  validates :title, :task, presence: true
end
