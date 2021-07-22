class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :skill_item, only: %i[show edit update destroy]
  #before_action :is_admin, only: %i[edit update new create destroy]
  #before_action :is_admin
  #layout 'admin'

  def index
    if params[:s]
      @skills = Skill.where('name = ?', params[:s])
    else
      @skills = Skill.all
    end
  end

  def create
    skill = Skill.create(skills_params)
    if skill.persisted?
      redirect_to skills_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render :new
    end

  end

  def new; end

  def show; end

  def edit; end

  def update
    if @skill.update(skills_params)
      redirect_to skills_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @skill.destroy.destroyed?
      redirect_to skills_path
    else
      flash.now[:error] = "Неможливо видалити дані"
      render body: skill.errors, status: :unprocessable_entity
    end
  end


  private

  def  skills_params
    params.permit(:name, :description)
  end

  def skill_item
    @skill = Skill.where(id: params[:id]).first
    render_404 unless @skill
  end

end
