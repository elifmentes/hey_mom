class Step < ApplicationRecord
  belongs_to :task

  validates :title, :task, presence: true
end
