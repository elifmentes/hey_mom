class Step < ApplicationRecord
  belongs_to :task

  validates :title, :task, :content, presence: true
end
