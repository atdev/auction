shared_examples_for "Admin accessible" do

  scenario 'Admin tries to get an access' do
    visit @path
    page.should_not have_content "You must be logged in as admin to access this section"
    current_path.should_not == root_path
  end

  scenario 'Non-admin user tries to get access' do
    user = User.first
    user.is_admin = false
    user.save!
    visit @path
    page.should have_content "You must be logged in as admin to access this section"
  end
end