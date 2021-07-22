class CertsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :cert_item, only: %i[show edit update destroy]
  #before_action :is_admin, only: %i[edit update new create destroy]
  #before_action :is_admin
  #layout 'admin'

  def index
    if params[:s]
      @certs = Cert.where('name = ?', params[:s])
    else
      @certs = Cert.all
    end
  end

  def create
    cert = Cert.create(certs_params)
    if cert.persisted?
      redirect_to certs_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render :new
    end
  end

  def new; end

  def show; end

  def edit; end

  def update
    if @cert.update(certs_params)
      redirect_to certs_path
    else
      flash.now[:error] = "Заповніть усі поля коректно"
      render json: cert.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @cert.destroy.destroyed?
      redirect_to certs_path
    else
      flash.now[:error] = "Неможливо видалити дані"
      render json: cert.errors, status: :unprocessable_entity
    end
  end


  private

  def  certs_params
    params.permit(:name, :description)
  end

  def cert_item
    @cert = Cert.where(id: params[:id]).first
    render_404 unless @cert
  end

end
