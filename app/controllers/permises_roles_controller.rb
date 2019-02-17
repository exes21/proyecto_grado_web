class PermisesRolesController < ApplicationController
  before_action :set_permises_role, only: [:show, :edit, :update, :destroy]

  # GET /permises_roles
  # GET /permises_roles.json
  def index
    @permises_roles = PermisesRole.all
  end

  # GET /permises_roles/1
  # GET /permises_roles/1.json
  def show
  end

  # GET /permises_roles/new
  def new
    @permises_role = PermisesRole.new
  end

  # GET /permises_roles/1/edit
  def edit
  end

  # POST /permises_roles
  # POST /permises_roles.json
  def create
    @permises_role = PermisesRole.new(permises_role_params)

    respond_to do |format|
      if @permises_role.save
        format.html { redirect_to @permises_role, notice: 'Permises role was successfully created.' }
        format.json { render :show, status: :created, location: @permises_role }
      else
        format.html { render :new }
        format.json { render json: @permises_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permises_roles/1
  # PATCH/PUT /permises_roles/1.json
  def update
    respond_to do |format|
      if @permises_role.update(permises_role_params)
        format.html { redirect_to @permises_role, notice: 'Permises role was successfully updated.' }
        format.json { render :show, status: :ok, location: @permises_role }
      else
        format.html { render :edit }
        format.json { render json: @permises_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permises_roles/1
  # DELETE /permises_roles/1.json
  def destroy
    @permises_role.destroy
    respond_to do |format|
      format.html { redirect_to permises_roles_url, notice: 'Permises role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permises_role
      @permises_role = PermisesRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permises_role_params
      params.require(:permises_role).permit(:permises_id, :roles_id)
    end
end
