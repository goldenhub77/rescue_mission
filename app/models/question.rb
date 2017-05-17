class Question < ApplicationRecord
  #these associations may change as application progresses
  has_many :answers
  has_many :user_question_associations
  has_many :users, through: :user_question_associations

  validates :title, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }
end
