class Instruction < ApplicationRecord
  belongs_to :step

  validates :title, :content, :step, presence: true
end
