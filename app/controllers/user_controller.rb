class UserController < ApplicationController

  def user
    @user = {email: 'charlotte@hoi.com', password: 'hallo123'}
    render json: @user
  end
end
