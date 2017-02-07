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
    fill_in 'Address', with: "123 Summer Street Boston MA 02771"
    fill_in 'Description', with: "Things happened here!"

    click_on 'Add Event'

    fill_in 'Review', with: "What a great event!"

    click_on 'Submit'

    expect(page).to have_content("Review created successfully!")
  end

  xscenario 'unsuccessfully review' do
    login_as_user(user_one)
    visit events_path

    fill_in 'Name', with: "An Event"
    fill_in 'Date', with: "12/12/12"
    fill_in 'Address', with: "123 Summer Street Boston MA 02999"
    fill_in 'Description', with: "Things happened here!"


    click_on 'Add Event'

    click_on 'Submit'

    fill_in "Review", with: ""

    expect(page).to have_content('Body can\'t be blank')
  end

  scenario 'user can edit review' do
    login_as_user(user_one)

    visit events_path

    fill_in 'Name', with: "An Event"
    fill_in 'Date', with: "12/12/12"
    fill_in 'Address', with: "123 Summer Street Boston MA 02999"
    fill_in 'Description', with: "Things happened here!"

    click_on 'Add Event'

    fill_in 'Review', with: "What a great event!"

    click_on 'Submit'

    click_on 'Edit Review'

    fill_in 'Review', with: "That was a great event."

    click_on 'Submit'

    expect(page).to have_content "Review updated successfully!"
  end
end
