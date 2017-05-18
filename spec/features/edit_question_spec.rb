require 'rails_helper'

feature "edit question" do
  let(:question) { Question.create(title: "How do you setup the rails environment on a windows machine?", description: "I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")}
  scenario "change title and description of question" do

    visit question_path(question.id)
    click_on("Edit")
    expect(page).to have_content("Edit Question", "How do you setup the rails environment on a windows machine?","I have been attempting to install this and I get the following errors: error 1, error 2, error 3, error 4, error 5, error 6, and error 7, I uninstalled and followed the directions but still cannot get it to load")
    fill_in("Title", with: "This is what the new title will look like")
    fill_in("Description", with: "The description of the old question is now this one. You can see that it updated to the database successfully")
    click_on("Update Question")
    updated_question = Question.find(question.id)
    expect(updated_question.title).to eq("This is what the new title will look like")
    expect(updated_question.description).to eq("The description of the old question is now this one. You can see that it updated to the database successfully")
    expect(page).to have_content("Recent Questions", "This is what the new title will look like")
  end

  scenario "change title and description of question with invalid inputs" do

    visit question_path(question.id)
    click_on("Edit")
    expect(page).to have_content("Edit Question", "This is what the new title will look like", "The description of the old question is now this one. You can see that it updated to the database successfully")
    fill_in("Title", with: "")
    fill_in("Description", with: "")
    click_on("Update Question")
    expect(page).to have_content("Edit Question", "Title can't be blank, Title is too short (minimum is 20 characters), Description can't be blank, Description is too short (minimum is 50 characters)")
  end
end
