class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :book_id, uniqueness: { scope: [:book_id, :user_id] }
end
