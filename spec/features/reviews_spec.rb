require 'rails_helper'

RSpec.feature 'user can add reviews' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password")
  }

  scenario 'successfully adds review' do
    login_as_user(user_one)

    visit events_path

    fill_in 'Name', with: "An Event"
    fill_in 'Date', with: "12/12/12"
    fill_in 'Address', with: "123 Summer Street"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "MA"
    fill_in 'Zip code', with: "02999"
    fill_in 'Description', with: "Things happened here!"

    click_on 'Add Event'

    click_on 'Add Review'
    fill_in 'Review', with: "What a great event!"

    click_on 'Submit Review'

    expect(page).to have_content("Review created successfully!")
  end

  scenario 'unsuccessfully review' do
    login_as_user(user_one)
    visit events_path

    fill_in 'Name', with: "An Event"
    fill_in 'Date', with: "12/12/12"
    fill_in 'Address', with: "123 Summer Street"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "MA"
    fill_in 'Zip code', with: "02999"
    fill_in 'Description', with: "Things happened here!"

    click_on 'Add Event'

    click_on 'Add Review'

    click_on 'Submit Review'

    expect(page).to have_content('Body can\'t be blank')
  end
end
