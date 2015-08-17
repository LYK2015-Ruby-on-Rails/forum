class UsersController < ApplicationController
  def edit_profile
  end

  def update_profile
    @user = current_user.update( user_params )
    redirect_to root_path
  end

  private
    def user_params
    params.require(:user).permit(:avatar)
  end
end
