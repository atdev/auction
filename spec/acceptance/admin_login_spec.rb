require 'acceptance/acceptance_helper'

feature "Admin logging in to admin area", %q{
  In order to manage auction's settings
  As an admin
  I want to logging into admin area
 } do

  context 'Admin' do
    background do
      User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', is_admin: true)
    end

    scenario "Unauthenticated user tries to get an access to admin area" do
      visit admin_products_path
      current_path.should == root_path
      page.should have_content 'You must be logged in as admin to access this section'
    end

    scenario "Admin saccessfully logged into admin area" do
      visit new_user_session_path
      sign_in_with 'admin@test.com', '12345678'
      page.should have_content "Signed in successfully"
    end

    scenario "User fill in wrong credentials" do
      visit new_user_session_path
      sign_in_with 'admin@test.com', 'wrong'
      current_path.should == new_user_session_path
      page.should have_content "Invalid email or password"
    end
  end

  scenario "Non-admin tries to get access to admin area" do
    User.create!(email: 'user@test.com', password: '12345678', password_confirmation: '12345678', is_admin: false)
    visit new_user_session_path
    sign_in_with 'user@test.com', '12345678'
    visit admin_products_path
    current_path.should == root_path
    page.should have_content "You must be logged in as admin to access this section"
  end
end