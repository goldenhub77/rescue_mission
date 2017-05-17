require 'rails_helper'

feature "sees question details" do
  let(:question) { Question.create(title: 'How do you setup the rails environment on a windows machine?', description: 'I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load')}

  scenario "see title and description" do

    visit question_path(question.id)
    expect(page).to have_content(question.title, question.description)
  end
end
