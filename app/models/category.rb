class Category < ApplicationRecord
  searchkick

  has_many :tasks

  validates :name, presence: true, inclusion: { in: %w[Food Health Housekeeping Productivity Relationship Wallet] }
end
