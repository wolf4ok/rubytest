class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :user_item, only: %i[show edit update destroy]
  #before_action :is_admin, only: %i[edit update new create destroy]
  #before_action :is_admin
  #layout 'admin'

  def index
    if params[:s]
      @users = User.where('lastname = ?', params[:s])
    else
      @users = User.all
    end
  end

  def create
    @user = User.create(users_params)
    if @user.persisted?
      redirect_to users_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def update
    if @user.update(users_params)
      redirect_to users_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy.destroyed?
      redirect_to users_path
    else
      flash.now[:error] = "Неможливо видалити дані"
      render json: user.errors, status: :unprocessable_entity
    end
  end


  private

  def  users_params
    params.require(:user).permit(:lastname, :firstname, :surname, :foto, :mail, :home, :resume, :resume_active, :comment, :skills)
  end

  def user_item
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end

end
