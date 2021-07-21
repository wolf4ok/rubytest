class UsersController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def create
    user = User.create(users_params)
    if user.persisted?
      redirect_to users_path
    else
      render body: user.errors, status: :unprocessable_entity
    end
  end

  def new; end

  def show
    unless (@user = User.where(id: params[:id]).first)
      render body: 'User not found or delete', status: 404
    end
  end

  def edit
    unless (@user = User.where(id: params[:id]).first)
      render body: 'User not found or delete', status: 404
    end
  end

  def update
    user = User.where(id: params[:id]).first
    if user.update(users_params)
      redirect_to users_path
    else
      render body: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.where(id: params[:id]).first.destroy
    if user.destroyed?
      redirect_to users_path
    else
      render body: user.errors, status: :unprocessable_entity
    end
  end

  def  users_params
    params.permit(:lastname, :firstname, :surname, :mail, :home, :resume_active)
  end

end
