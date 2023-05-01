class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        message: 'User created successfully.'
      },
        status: :created
    end
    render json: @user.errors, status: :unprocessable_entity
  end

  private
  def user_params
    params.require(:user).permit(:name,:email, :password_digest)
  end
end


