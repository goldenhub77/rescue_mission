require 'rails_helper'

feature "sees recent questions" do
  scenario "see recently posted questions" do
    Question.create(title: 'How do you setup the rails environment on a windows machine?', description: 'I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load')
    Question.create(title: 'how to validate rails and make assocations?', description: 'I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load')
    recent_questions = Question.order(created_at: :desc)

    visit questions_path
    recent_questions.each do |question|
      expect(page).to have_content(question.title)
    end
  end
end
