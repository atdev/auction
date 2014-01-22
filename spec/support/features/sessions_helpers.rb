module Features
  module SessionsHelpers
    def sign_in_with(email, password)
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      click_on "Sign in"
    end

    def start_admin_session(email, password)
      visit new_user_session_path
      sign_in_with(email, password)
    end
  end
end