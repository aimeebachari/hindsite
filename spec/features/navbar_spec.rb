require 'rails_helper'

RSpec.feature 'navbar links' do

  let(:user_one) { User.create(
    email: "123@gmail.com",
    password: "password"
    )
  }

  scenario 'navbar has link to events index' do
    visit root_path

    within(".top-bar-left") do
      click_on "Places"
    end

    expect(page).to have_content "Add a Historical Place"
  end

  scenario 'navbar has link to trips index' do
    visit root_path

    within(".top-bar-left") do
      click_on "Trips"
    end

    expect(page).to have_content "New Trip Form"
  end

  scenario 'navbar has link to near me' do
    visit root_path

    within(".top-bar-left") do
      click_on "Near Me"
    end

    page.should have_css('div.geo-map')
  end

  scenario 'user logged in has link to edit profile' do
    login_as_user(user_one)

    click_on "Edit profile"

    expect(page).to have_content "Edit Info"
  end

  scenario 'user logged in has link to logout' do
    login_as_user(user_one)

    click_on "Logout"

    expect(page).to have_content "Signed out successfully."
  end

  scenario 'not logged in has link to signup' do
    visit root_path

    click_on "Sign up"

    expect(page).to have_content "Sign up"
  end

  scenario 'not logged in has link to login' do
    visit root_path
    
    click_on "Login"

    expect(page).to have_content "Log in"
  end
end
