class CertsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @certs = Cert.all
  end

  def create
    cert = Cert.create(certs_params)
    if cert.persisted?
      redirect_to certs_path
    else
      render body: cert.errors, status: :unprocessable_entity
    end
  end

  def new; end

  def show
    unless (@cert = Cert.where(id: params[:id]).first)
      render body: 'Cert not found or delete', status: 404
    end
  end

  def edit
    unless (@cert = Cert.where(id: params[:id]).first)
      render body: 'Cert not found or delete', status: 404
    end
  end

  def update
    cert = Cert.where(id: params[:id]).first
    if cert.update(certs_params)
      redirect_to certs_path
    else
      render body: cert.errors, status: :unprocessable_entity
    end
  end

  def destroy
    cert = Cert.where(id: params[:id]).first.destroy
    if cert.destroyed?
      redirect_to certs_path
    else
      render body: cert.errors, status: :unprocessable_entity
    end
  end

  def  certs_params
    params.permit(:name, :description)
  end
end
