require 'rails_helper'

feature "vote for best answer" do
  let!(:question) { Question.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")}
  let!(:answer) { question.answers.create(body: "This is a test answer for the previously created question to make sure we can vote it best") }
  let(:first_answer) { question.answers.first }
  scenario "click Vote Best button on question" do
    visit question_path(question.id)
    click_on("vote_best_#{first_answer.id}")
    expect(page).to have_content("Answers Voted Best Answer This is a test answer for the previously created question to make sure we can vote it best")
  end
end
