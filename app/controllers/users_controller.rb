class UsersController < ApplicationController
  def index
    @search = params[:search].split(" ")
    @users = Array.new
    @search.each do |search|
      @user = User.where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
      @users = @users + @user
    end

  end

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.order(created_at: :desc)
    @current = @statuses.take

    render("/users/show.html.erb")
  end

end
