module Features
  module SessionsHelpers
    def sign_in_with(email, password)
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      click_on "Sign in"
    end
  end
end