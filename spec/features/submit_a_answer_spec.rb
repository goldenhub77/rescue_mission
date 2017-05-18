require 'rails_helper'

feature "submit a answer to a question" do

  before(:each) do
    visit new_question_path
    fill_in("Title", with: "This is a test question that will be asked about rails")
    fill_in("Description", with: "The question being asked is about rails and is required to be answered by a person who understands rails and its concepts")
    click_on("Submit Question")
    click_on("This is a test question that will be asked about rails")
  end
  scenario "successfully submit answer" do
    fill_in("body", with: "You should continue being persistent and install some gems as these instructions are not going to help you move forward")
    click_on("Submit Answer")
    expect(page).to have_content("You should continue being persistent and install some gems as these instructions are not going to help you move forward")
  end

  scenario "fail to submit answer and display errors" do
    click_on("Submit Answer")
    expect(page).to have_content("Body can't be blank, Body is too short (minimum is 50 characters)")
  end
end
