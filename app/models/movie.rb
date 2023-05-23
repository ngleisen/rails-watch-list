class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception

  validates :title, :comment, presence: true, uniqueness: true
end
