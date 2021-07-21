class CertificatesController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @certificates = Certificate.all
  end

  def create
    certificate = Certificate.create(certificates_params)
    if certificate.persisted?
      redirect_to certificates_path
    else
      render body: certificate.errors, status: :unprocessable_entity
    end
  end

  def new; end

  def show
    unless (@certificate = Certificate.where(id: params[:id]).first)
      render body: 'Certificate not found or delete', status: 404
    end
  end

  def edit
    unless (@certificate = Certificate.where(id: params[:id]).first)
      render body: 'Certificate not found or delete', status: 404
    end
  end

  def update
    certificate = Certificate.where(id: params[:id]).first
    if certificate.update(certificates_params)
      redirect_to certificates_path
    else
      render body: certificate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    certificate = Certificate.where(id: params[:id]).first.destroy
    if certificate.destroyed?
      redirect_to certificates_path
    else
      render body: certificate.errors, status: :unprocessable_entity
    end
  end

  def  certificates_params
    params.permit(:user, :certs, :number, :data, :file)
  end
end
