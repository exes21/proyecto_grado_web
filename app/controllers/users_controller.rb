class UsersController < ApplicationController
  require 'roo'
  before_action :user, only: [:edit, :update]
  def index
    @user = User.new
    @users_import = UserImport.new
    @title = "Configuración de usuarios"
    @icon = "users"
    @q = User.ransack(params[:q])
    @students = @q.result(distinct: true).where(role: Role.second).paginate(page: params[:page], per_page: 10)
  end

  def inactivar_admin
    user = User.find(params[:id])
    if user.active?
      user.update_attribute(:active, false)
    else
      user.update_attribute(:active, true)
    end
    redirect_to administradores_path
  end

  def inactivar_user
    User.find(params[:id]).update_attribute(:active, false)
    redirect_to users_path
  end

  def usuario_administrador
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).where(role: Role.first).paginate(page: params[:page], per_page: 10)
  end

  def users_map
    @title = "Mapa de usuarios"
    @icon = "users"
    @users = User.all
  end

  def new
    @title = "Nuevo usuario"
    @icon = "users"
    @user = User.new
  end

  def edit
    @title = "Editar usuario"
    @icon = "users"
  end

  def load
    @title = "Cargar usuarios"
    @icon = "users"
    if UserImport.import(params[:user_import][:file])
      redirect_to users_path
    end
  end

  def create_administrator
    @user = User.new(user_params)
    @user.role = Role.first
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'El usuario ha sido creado' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      new_fields = user_params
      new_fields = user_params.except(:password, :password_confirmation ) if user_params[:password].blank?
      if @user.update_attributes(new_fields)
        if @user.role == Role.first
          format.html { redirect_to administradores_path, notice: 'El usuario ha sido creado' }
        else
          format.html { redirect_to users_path, notice: 'El usuario ha sido creado' }
        end
        
      else
        if @user.role == Role.first
          format.html { redirect_to administradores_path, notice: 'El usuario no ha sido creado' }
        else
          format.html { redirect_to users_path, notice: 'El usuario no ha sido creado' }
        end
      end
    end
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :name, :phone_number)
  end
end
