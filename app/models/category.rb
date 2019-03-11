class Category < ApplicationRecord
  has_many :tasks

   include PgSearch

  validates :name, presence: true, inclusion: { in: %w[Food Health Housekeeping Productivity Relationship Wallet] }
end
