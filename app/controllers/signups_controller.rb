class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

    private
    def signup_params
        params.permit(:activity_id, :camper_id, :time)
    end
end
