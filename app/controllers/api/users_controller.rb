class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb"
  end

  def show  
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]

    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id])

    @user.user_goals = {
      quick_apply: params[:quick_apply], 
      intentional_apply: params[:intentional_apply], 
      info_interview: params[:info_interview], 
      white_boarding_minutes: params[:white_boarding_minutes], 
      portfolio_minutes: params[:portfolio_minutes] 
    }

    @user.save

    render json: {message: "goals were saved"}
  end
end
