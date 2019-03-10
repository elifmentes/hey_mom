class Step < ApplicationRecord
  include PgSearch
  multisearchable against: [:title, :content]

  belongs_to :task

  validates :title, :task, :content, presence: true
end
