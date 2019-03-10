class Task < ApplicationRecord

 include PgSearch
  multisearchable against: [:title]
  belongs_to :category
  has_many :steps

  validates :title, :category, presence: true
end
