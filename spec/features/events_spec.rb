require 'rails_helper'

RSpec.feature 'user can add events' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password",
    role: "admin")
  }

  scenario 'successfully adds a event' do
    login_as_user(user_one)

    visit events_path

    fill_in "Name", with: "New Event"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Add Event"

    expect(page).to have_content "Event created successfully!"
  end

  scenario 'user unsuccessfully adds event' do
    login_as_user(user_one)

    visit events_path

    fill_in "Name", with: "New Event"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"

    click_on "Add Event"

    expect(page).to have_content "Description can't be blank"
  end

  scenario 'user can edit event they created' do
    login_as_user(user_one)

    visit events_path

    fill_in "Name", with: "New Event"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Add Event"

    click_on "Edit Event"

    fill_in "Name", with: "Historic Place"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Update"

    expect(page).to have_content "Event successfully updated"
  end

  scenario 'user unsuccessfully edits event they created' do
    login_as_user(user_one)

    visit events_path

    fill_in "Name", with: "New Event"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Add Event"

    click_on "Edit Event"

    fill_in "Name", with: "Historic Place"
    fill_in "Date", with: ""
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Update"

    expect(page).to have_content "Date can't be blank"
  end

  scenario 'user can delete an event they created' do
    login_as_user(user_one)

    visit events_path

    fill_in "Name", with: "New Event"
    fill_in "Date", with: "1776"
    fill_in "Address", with: "77 Summer St. Boston, MA 02111"
    fill_in "Description", with: "Something important happened here."

    click_on "Add Event"

    click_on "Edit Event"

    click_on "Delete"

    expect(page).to_not have_content "New Event"
  end

end
