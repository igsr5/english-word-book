class Word < ApplicationRecord
  validates :origin, presence: true
  validates :text, presence: true

  belongs_to :user
end
