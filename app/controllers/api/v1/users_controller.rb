
 class Api::V1::UsersController < ApplicationController
  # POST /register

  def create
      user = User.create(user_params)

      if user
        jwt = Auth.encrypt({ user_id: user.id })
        render json: { jwt: jwt, current: user }
      else
        render json: { error: 'Failed to Sign Up' }, status: 400
      end
    end

    def login
      user = User.find_by(email: params[:user][:email])

      if user && user.authenticate(params[:user][:password])
        jwt = Auth.encrypt({ user_id: user.id })
        render json: { jwt: jwt, current: user }
      else
        render json: { error: 'Invalid Email or Password' }, status: 400
      end
    end

    def show
      render json: get_current_user
    end
    def destroy
      session[:user_id] = nil
      @user = User.find(params[:id])
      @user.destroy
      render json: @user
    end

    private

    def user_params
      params.require(:user).permit(
          :name,
          :email,
          :password,
          :password_confirmation

        )
    end
  end
