class UsersController < ApplicationController
  before_action :authenticate_user!
  require 'roo'

  def index
    @user = User.new
    @users_import = UserImport.new
    @title = "Configuración de Usuarios"
    @icon = "users"
    @q = User.ransack(params[:q])
    @students = @q.result(distinct: true).where(role: Role.second).paginate(page: params[:page], per_page: 10)
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
    @title = "NUevo Usuario"
    @icon = "users"
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
