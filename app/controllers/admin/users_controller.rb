class Admin::UsersController < ApplicationController
  before_action :set_admin_user, only: %i[ show update destroy ]

  # GET /admin/users
  def index
    @admin_users = Admin::User.all

    render json: @admin_users
  end

  # GET /admin/users/1
  def show
    render json: @admin_user
  end

  # POST /admin/users
  def create
    @admin_user = Admin::User.new(admin_user_params)

    if @admin_user.save
      render json: @admin_user, status: :created, location: @admin_user
    else
      render json: @admin_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @admin_user.update(admin_user_params)
      render json: @admin_user
    else
      render json: @admin_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/users/1
  def destroy
    @admin_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.fetch(:admin_user, {})
    end
end
