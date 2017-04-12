class Question < ApplicationRecord
  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }

  has_many :answers
end
