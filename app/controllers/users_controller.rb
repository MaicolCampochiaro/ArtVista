class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update show index]

  def index

  def show
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id or /users/:id.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:nickname, :avatar, :address)
  end
end
