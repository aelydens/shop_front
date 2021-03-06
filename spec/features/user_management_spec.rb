require "rails_helper"

feature "Users" do
  scenario "can signup with valid credentials" do
    visit root_path

    click_on "Sign Up"

    fill_in "Username", with: "shopper123"
    fill_in "Password", with: "password"

    within("form") do
      click_on "Sign Up"
    end

    expect(page).to have_content "Welcome, shopper123"
    expect(page).to have_link "Sign Out"
  end

  scenario "can sign in" do
    user = create_user

    visit root_path
    click_on "Sign In"
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within("form") do
      click_on "Sign In"
    end

    expect(page).to have_content "Welcome, luv2shop"
    expect(current_path).to eq(products_path)
  end

  scenario "can sign out" do
    user = create_user(username: "paaamm", password: "password")
    sign_in

    click_on "Sign Out"

    expect(page).to have_content "Signed Out"
  end
end
