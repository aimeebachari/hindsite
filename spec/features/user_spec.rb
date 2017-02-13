require 'rails_helper'

RSpec.feature 'user can add events' do

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
end
