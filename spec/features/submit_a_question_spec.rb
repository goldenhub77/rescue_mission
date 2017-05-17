require 'rails_helper'

feature "submit a question" do

  before(:each) do
    visit new_question_path
  end
  scenario "successfully submit question" do
    expect(page).to have_content("Submit a question Title Description")
    fill_in("Title", with: "This is a test question that will be asked about rails")
    fill_in("Description", with: "The question being asked is about rails and is required to be answered by a person who understands rails and its concepts")
    click_on("Submit Question")
    expect(page).to have_content("Recent Questions Submit Question This is a test question that will be asked about rails")
  end

  scenario "fail to submit question and display errors" do
    expect(page).to have_content("Submit a question Title Description")
    click_on("Submit Question")
    expect(page).to have_content("Submit a question Title can't be blank, Title is too short (minimum is 20 characters), Description can't be blank, Description is too short (minimum is 50 characters) Title Description")
  end
end
