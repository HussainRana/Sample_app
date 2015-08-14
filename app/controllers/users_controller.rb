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

   def create
     # raise params[user_params].inspect
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      #handle successful save
      flash[:success] = "Welcome to sample_app"
      redirect_to @user
    else
    @title = "Sign up"
    render :new
    end
  end
end
