require 'rails_helper'

feature "submit a answer to a question" do
  let!(:user) { FactoryGirl.create(:user) }
  let(:question) { user.questions.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")}
  before(:each) do
    sign_in_as user
    visit question_path(question)
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
