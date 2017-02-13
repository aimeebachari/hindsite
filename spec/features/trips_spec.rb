require 'rails_helper'

RSpec.feature 'user can add trips' do

  let(:user_one) do User.create(
    email: "123@gmail.com",
    password: "password",
    role: "admin")
  end

  scenario 'successfully adds a trip' do
    login_as_user(user_one)

    Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    Event.create(
      name: "Another Event",
      date: "1805",
      address: "123 Summer St. Boston, MA 02112",
      description: "A different thing happed there."
    )

    visit new_trip_path

    fill_in 'Name', with: "A cool trip"

    within(".start-event") do
      select('New Event')
    end

    within(".end-event") do
      select('Another Event')
    end

    click_on 'Create a Trip'

    expect(page).to have_content "Trip created successfully!"
  end

  scenario 'unsuccessfully creates trip' do
    login_as_user(user_one)

    Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    Event.create(
      name: "Another Event",
      date: "1805",
      address: "123 Summer St. Boston, MA 02112",
      description: "A different thing happed there."
    )

    visit new_trip_path

    within(".start-event") do
      select('New Event')
    end

    within(".end-event") do
      select('Another Event')
    end

    click_on 'Create a Trip'

    expect(page).to have_content "Name can't be blank"
  end

  scenario 'unsuccessfully creates trip' do
    login_as_user(user_one)

    Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    Event.create(
      name: "Another Event",
      date: "1805",
      address: "123 Summer St. Boston, MA 02112",
      description: "A different thing happed there."
    )

    visit new_trip_path

    within(".start-event") do
      select('New Event')
    end

    within(".end-event") do
      select('New Event')
    end

    click_on 'Create a Trip'

    expect(page).to have_content "End event : start and end can't be the same"
  end

  scenario 'admin can delete trip' do
    login_as_user(user_one)

    Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    Event.create(
      name: "Another Event",
      date: "1805",
      address: "123 Summer St. Boston, MA 02112",
      description: "A different thing happed there."
    )

    visit new_trip_path

    fill_in 'Name', with: "A cool trip"

    within(".start-event") do
      select('New Event')
    end

    within(".end-event") do
      select('Another Event')
    end

    click_on 'Create a Trip'

    expect(page).to have_content "A cool trip"
  end
end
