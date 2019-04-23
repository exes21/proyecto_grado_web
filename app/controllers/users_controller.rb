class UsersController < ApplicationController
  require 'roo'

  def index
    @user = User.new
    @users_import = UserImport.new
    @title = "Configuración de Usuarios"
    @icon = "users"
    @q = User.ransack(params[:q])
    @students = @q.result(distinct: true).where(role: Role.second).paginate(page: params[:page], per_page: 10)
  end

  def inactivar_admin
    User.find(params[:id]).update_attribute(:active, false)
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
    @title = "Mapa de Usuarios"
    @icon = "users"
    @users = User.all
  end

  def new
    @title = "Nuevo Usuario"
    @icon = "users"
    @user = User.new
  end

  def edit
    @title = "Editar Usuario"
    @icon = "users"
  end

  def load
    @title = "Cargar Usuarios"
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
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :name, :phone)
  end
end
