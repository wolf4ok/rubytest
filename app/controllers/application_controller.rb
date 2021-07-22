class ApplicationController < ActionController::Base

  def render_403
    render file: "#{Rails.root}/public/403.html", status: :forbidden
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def is_admin
    render_403 unless current_user.admin
    #render json: 'Access denied!', status: :forbidden unless current_user.admin
  end

end
