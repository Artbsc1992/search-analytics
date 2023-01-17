class Article < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_title_and_content,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true, any_word: true } 
    }
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
end
