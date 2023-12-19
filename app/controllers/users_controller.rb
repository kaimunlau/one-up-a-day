class UsersController < ApplicationController
  def index
    @users = User.all.sort_by(&:first_name)
  end
end
