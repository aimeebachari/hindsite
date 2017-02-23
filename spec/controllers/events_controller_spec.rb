require "rails_helper"

RSpec.describe Api::V1::EventsController, type: :controller do
  include Capybara::DSL

    let(:user_one) do User.create(
      email: "123@gmail.com",
      password: "password",
      role: "admin"
      )
    end

    let(:user_two) do User.create(
      email: "aimee@gmail.com",
      password: "password"
      )
    end

    let(:event) do Event.create(
      name: "New Event",
      date: "1776",
      address: "77 Summer St. Boston, MA 02111",
      description: "Something important happened here."
    )
    end

    let(:review_one) do Review.create(
      user: user_one,
      event: event,
      body: "This was a great place."
      )
    end

    let(:review_two) do Review.create(
      user: user_two,
      event: event,
      body: "I've been to better places, but overall not bad."
      )
    end

  # describe "GET reviews" do
  #   it "should return all reviews" do
  #     login_as_user(user_one)
  #     get :show, params: { id: event.id }
  #     json = JSON.parse(response.body)
  #
  #     expect(json["reviews"].length).to eq(2)
  #     expect(json["reviews"][0]["body"]).to eq("This was a great place.")
  #     expect(json["reviews"][1]["body"]).to eq("I've been to better places, but overall not bad.")
  #
  #   end
  # end
end
