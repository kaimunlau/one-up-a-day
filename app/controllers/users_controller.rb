class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @users = User.order(:first_name)
  end
end
