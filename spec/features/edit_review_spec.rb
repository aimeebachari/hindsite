require 'rails_helper'

RSpec.feature 'user can edit reviews' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password",
    role: "admin")
  }

  scenario 'user can edit review they created' do
    login_as_user(user_one)

    event = Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    review = Review.create(
      body: "A great place.",
      event: event,
      user: user_one
    )

    visit edit_event_review_path(event, review)

    fill_in "Review", with: "A really really great place!"

    click_on "Update"

    expect(page).to have_content "Review updated successfully!"
  end

  scenario 'user edits review unsuccessfully' do
    login_as_user(user_one)

    event = Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    review = Review.create(
      body: "A great place.",
      event: event,
      user: user_one
    )

    visit edit_event_review_path(event, review)

    fill_in "Review", with: ""

    click_on "Update"

    expect(page).to have_content "Body can't be blank"
  end

  scenario 'user can delete review they created' do
    login_as_user(user_one)

    event = Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )

    review = Review.create(
      body: "A great place.",
      event: event,
      user: user_one
    )

    visit edit_event_review_path(event, review)

    click_on "Delete"

    expect(page).to have_content "Review successfully deleted."
  end
end
