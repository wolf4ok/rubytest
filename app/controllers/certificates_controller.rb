class CertificatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :certtificate_item, only: %i[show edit update destroy]
  #before_action :is_admin, only: %i[edit update new create destroy]
  #before_action :is_admin
  #layout 'admin'

  def index
    if params[:s]
      @certificates = Certificate.where('number = ?', params[:s])
    else
      @certificates = Certificate.all
    end
  end

  def create
    certificate = Certificate.create(certificates_params)
    if certificate.persisted?
      redirect_to certificates_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render :new
    end
  end

  def new; end

  def show; end

  def edit; end

  def update
    if @certificate.update(certificates_params)
      redirect_to certificates_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render json: certificate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @certificate.destroy.destroyed?
      redirect_to certificates_path
    else
      flash.now[:error] = "Неможливо видалити дані"
      render json: certificate.errors, status: :unprocessable_entity
    end
  end


  private

  def  certificates_params
    params.permit(:user_id, :cert_id, :number, :data, :file)
  end

  def certtificate_item
    @certificate = Certificate.where(id: params[:id]).first
    render_404 unless @certificate
  end

end
