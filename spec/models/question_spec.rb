require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '.create' do
    it 'question fails to commit' do
      question = Question.create()
      expect(question.valid?).to eq(false)
      expect(question.errors.full_messages).to eq(["User must exist", "Title can't be blank", "Title is too short (minimum is 20 characters)", "Description can't be blank", "Description is too short (minimum is 50 characters)", "User can't be blank"])
    end

    it 'question commits successfully' do
      user = FactoryGirl.create(:user)
      question = user.questions.create(title: "This is test question 1 created successfully", description: "This is a description for question 1 and has to be at least 50 characters long")
      expect(question.valid?).to eq(true)
    end
  end
end
