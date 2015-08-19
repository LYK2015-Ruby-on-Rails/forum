class UsersController < ApplicationController
  def edit_profile
  end

  def update_profile
    @user = current_user.update( user_params )
    address = {country: params[:user][:country], city: params[:user][:city], town: params[:user][:town], detail: params[:user][:detail]}
    current_user.update_attributes(address: address)
    redirect_to root_path
  end

  private
    def user_params
    params.require(:user).permit(:avatar)
  end
end
