def sign_in
  user = create_user
  visit sign_in_path

  fill_in "Username", with: user.username
  fill_in "Password", with: user.password

  within("form") { click_on "Sign In" }
end
