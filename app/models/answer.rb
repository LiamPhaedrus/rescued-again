class Answer < ApplicationRecord
  validates :body, length: { minimum: 50 }

  belongs_to :question
end
