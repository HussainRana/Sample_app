class UsersController < ApplicationController
  def new
  	@title = "Sign up"
  	# user_params
  end

  def show
  	@user = User.find(params[:id])
  end
  # def user_params
  # 	params.require(:user).permit(:name, :email)
  # end

end
