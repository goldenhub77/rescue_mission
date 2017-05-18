require 'rails_helper'

feature "delete question" do
  let(:question) { Question.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")}
  scenario "click on delete button from edit page" do
    visit question_path(question.id)
    click_on("Edit")
    click_on("Delete")
    expect { Question.find(question.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    expect(page).not_to have_content("How do you setup the rails environment on a windows machine?")
  end
end
