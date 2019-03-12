class Task < ApplicationRecord
  belongs_to :category
  has_many :steps


  include PgSearch

  validates :title, :category, presence: true
end
