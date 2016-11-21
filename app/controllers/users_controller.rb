class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.order(created_at: :desc)
    @current = @statuses.take

    render("/users/show.html.erb")
  end

end
