class SkillsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @skills = Skill.all
  end

  def create
    skill = Skill.create(skills_params)
    if skill.persisted?
      redirect_to skills_path
    else
      render body: skill.errors, status: :unprocessable_entity
    end

  end

  def new; end

  def show
    unless (@skill = Skill.where(id: params[:id]).first)
      render body: 'Skill not found or delete', status: 404
    end
  end

  def edit
    unless (@skill = Skill.where(id: params[:id]).first)
      render body: 'Skill not found or delete', status: 404
    end
  end

  def update
    skill = Skill.where(id: params[:id]).first
    if skill.update(skills_params)
      redirect_to skills_path
    else
      render body: skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    skill = Skill.where(id: params[:id]).first.destroy
    if skill.destroyed?
      redirect_to skills_path
    else
      render body: skill.errors, status: :unprocessable_entity
    end
  end

  def  skills_params
    params.permit(:name, :description)
  end
end
