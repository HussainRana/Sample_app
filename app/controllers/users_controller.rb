class UsersController < ApplicationController
    def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
  	@title = "Sign up"
  	# user_params
  end


  # def user_params
  # 	params.require(:user).permit(:name, :email)
  # end

end
