require 'rails_helper'

RSpec.feature 'user can add events' do

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
end
