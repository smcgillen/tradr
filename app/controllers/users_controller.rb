class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    @users = User.order(:email)
  end

  def index
    @users = User.all

  end

end