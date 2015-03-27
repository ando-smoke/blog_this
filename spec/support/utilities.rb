def sign_in(user)
  visit new_user_session_path
  click_on "Sign In"
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Sign in"
end
