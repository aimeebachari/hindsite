require 'rails_helper'

RSpec.feature 'user can add reviews' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password",
    role: "admin")
  }

  xscenario 'successfully adds a trip' do
    login_as_user(user_one)

    visit new_trip_path

    fill_in 'Name', with: "A cool trip"
    select 'African Meeting House'
    select 'Boston Anethaeum', from: 'End event'

    click_on 'Create a Trip'

    expect(page).to have_content("Trip created successfully!")
  end

  xscenario 'unsuccessfully creates trip' do
    login_as_user(user_one)

    visit new_trip_path

    select 'African Meeting House', from: 'Start event'
    select 'Boston Anethaeum', from: 'End event'

    click_on 'Create a trip'

    expect(page).to have_content('Name can\'t be blank')
  end

  xscenario 'admin can delete trip' do
    login_as_user(user_one)

    visit new_trip_path

    fill_in 'Name', with: "A cool trip"
    select 'African Meeting House'
    select 'Boston Anethaeum', from: 'End event'

    click_on 'Create a Trip'

    click_on 'Delete Event'

    expect(page).to have content("")
  end
end
