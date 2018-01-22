class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id).order("id ASC")
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :birth, :gender, :school)
  end

end
