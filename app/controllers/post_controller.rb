class PostController < ApplicationController
  def index
    if params[:s] != nil && !Certificate.where('number = ?', params[:s]).blank?
      @file = Certificate.where('number = ?', params[:s])
      else
        if params[:s] != nil
          @file = 'nil_nil'
        end
    end
  end
end
