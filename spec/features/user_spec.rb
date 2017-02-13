require 'rails_helper'

RSpec.feature 'user can add events' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password"
    )
  }

  scenario 'user successfully signs up' do
    visit root_path

    click_on 'Sign up'

    fill_in 'Email', with: 'user@123.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Create Account'

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'user unsuccessfully signs up' do
    visit root_path

    click_on 'Sign up'

    fill_in 'Email', with: 'user@123.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password12'

    click_on 'Create Account'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'user can login' do
    login_as_user(user_one)

    expect(page).to have_content "Signed in successfully."
  end

  scenario 'user can log out' do
    login_as_user(user_one)

    click_on "Logout"

    expect(page).to have_content "Signed out successfully."
  end

  scenario 'user can delete account' do
    login_as_user(user_one)

    click_on "Edit profile"

    click_on "Cancel my account"

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end

  scenario 'user can edit account' do
    login_as_user(user_one)

    click_on "Edit profile"

    fill_in "Email", with: "1234@gmail.com"
    fill_in "Current password", with: "password"

    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end
end
