require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '.create' do
    it 'answer fails to commit' do
      answer = Answer.create()
      expect(answer.valid?).to eq(false)
      expect(answer.errors.full_messages).to eq(["Question must exist", "User must exist", "Body can't be blank", "Body is too short (minimum is 50 characters)", "Question can't be blank"])
    end

    it 'answer commits successfully' do
      user = FactoryGirl.create(:user)
      question = user.questions.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")
      answer = Answer.create(body: "This is a test to make sure an question can be created successfully", question_id: question.id, user_id: user.id)
      expect(answer.valid?).to eq(true)
    end
  end
end
