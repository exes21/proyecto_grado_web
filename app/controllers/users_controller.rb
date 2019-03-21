class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.new
    @users = User.where(role: Role.first)
    @students = User.where(role: Role.second)
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'El usuario ha sido creado' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end
end
