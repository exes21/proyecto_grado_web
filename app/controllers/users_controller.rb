class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    
  end

  def edit
  end

  def create
  end

  def update
  end

end
