class Question < ApplicationRecord
  #these associations may change as application progresses
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }
end
