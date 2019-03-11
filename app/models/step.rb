class Step < ApplicationRecord
  belongs_to :task

  include PgSearch
  pg_search_scope :global_search,
    against: [ :title, :content ],
    using: {
      tsearch: { prefix: true }
    }

  validates :title, :task, :content, presence: true
end
