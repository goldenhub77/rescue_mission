require 'rails_helper'

feature "User can sign in and out via github" do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit root_path
  end

  scenario "sign in as a user" do
    sign_in_as user
    expect(page).to have_content("Signed in as #{user.name}")
  end

  scenario "sign out" do
    sign_in_as user
    click_on("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).not_to have_content("Signed in as")
  end
end
