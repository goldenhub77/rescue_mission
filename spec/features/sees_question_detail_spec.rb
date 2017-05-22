require 'rails_helper'

feature "sees question details" do
  let!(:user) { FactoryGirl.create(:user) }
  let(:question) { user.questions.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")}
  let!(:answer) { question.answers.create(body: "This is a test answer to verify how one would display when inputted on the screen with 50 or more characters", user_id: user.id) }
  let(:answers) { question.answers }
  scenario "see title and description" do
    sign_in_as user
    visit question_path(question.id)
    expect(page).to have_content(question.title, question.description)
    expect(page).to have_content("Submit an answer")
    expect(page).to have_content("Answers")
    answers.each do |answer|
      expect(page).to have_content(answer.body)
    end
  end
end
