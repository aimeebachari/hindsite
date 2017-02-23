require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
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

  # xdescribe "POST #create" do
  #   it "adds an review to an event" do
      # harry = User.find_by(name: "basiliskSlayer")
      # session[:user_id] = harry.id
      # post :create, params: {
      #   task: {
      #     name: "Transfiguration",
      #     importance: "High",
      #     reps: 3,
      #     period: "Week"
      #   }
      # }
      # transfiguration = Task.find_by(name: "Transfiguration")
      # tasks = harry.tasks
      #
      # expect(tasks.length).to eq(4)
      # expect(tasks.include?(transfiguration)).to be(true)
  #   end
  # end
end
