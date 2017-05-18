class Question < ApplicationRecord
  #these associations may change as application progresses
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }
  validate :best_answer_exists?

private

  def best_answer_exists?
    begin
      result = Answer.find(self.best_answer)
    rescue ActiveRecord::RecordNotFound
      if result.nil?
        return true
      else
        errors.add(:best_answer, "This answer id does not exist!")
      end
    end
  end
end
