class Answer < ApplicationRecord
  #these associations may change as application progresses
  belongs_to :question

  validates :body, presence: true, length: { minimum: 50 }
  validates :question_id, presence: true
end
